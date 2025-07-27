#!/usr/bin/env zsh
spellfix-interactive() {
    local text="$1"
    echo "🔍 Prüfe: $text"
    echo ""
    
    local corrected_text="$text"
    local temp_file="/tmp/hunspell_$$"
    
    # Hunspell Ausgabe in Datei speichern
    echo "$text" | hunspell -d de_DE -a > "$temp_file"
    
    # Datei Zeile für Zeile verarbeiten (ohne Subshell)
    while IFS= read -r line; do
        if [[ $line == \&* ]]; then
            local word=$(echo "$line" | cut -d' ' -f2)
            local suggestions_raw=$(echo "$line" | cut -d':' -f2 | sed 's/^ *//')
            
            echo "❌ Fehler gefunden: '$word'"
            echo "Vorschläge:"
            
            # Einfach mit nl numerieren
            echo "$suggestions_raw" | tr ',' '\n' | sed 's/^ *//' | sed 's/ *$//' | nl -w2 -s'. '
            
            echo "  0. Überspringen"
            
            # Read von /dev/tty um stdin-Konflikt zu vermeiden
            echo -n "Wähle eine Nummer: "
            read choice < /dev/tty
            
            if [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 1 ]]; then
                local selected=$(echo "$suggestions_raw" | tr ',' '\n' | sed -n "${choice}p" | sed 's/^ *//' | sed 's/ *$//')
                if [[ -n "$selected" ]]; then
                    echo "✅ Ersetze '$word' mit '$selected'"
                    # Use zsh string replacement instead of sed with \b
                    corrected_text="${corrected_text/$word/$selected}"
                fi
            else
                echo "Überspringe '$word'"
            fi
            echo ""
        fi
    done < "$temp_file"
    
    # Aufräumen
    rm -f "$temp_file"
    
    echo "Korrigiert: $corrected_text"
    echo "$corrected_text" | pbcopy
    echo "📋 In Zwischenablage kopiert!"
}

# Aliases
alias sfix='spellfix-interactive'
alias spellcheck-de='hunspell -d de_DE -l'
alias spellcheck-en='hunspell -d en_US -l'
