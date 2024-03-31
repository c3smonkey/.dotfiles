#!/bin/zsh

alias vi="nvim"
alias g="lazygit"
alias so="source ~/.zshrc"
alias f="fuck"
alias python="python3"
alias pip3="pip"
alias mon="bpytop"
alias task="taskell"
alias t="tmux"


# maven
alias m=mvnd
alias mci='mvnd clean install'
alias mvv='mvnd -v'
alias mci='mvnd clean install'
alias mciT='mvnd clean install -DskipTests'
alias mciTT='mvnd clean install -Dmaven.test.skip'
alias mcd='mvnd clean deploy'
alias mcdT='mvnd clean deploy -DskipTests'
alias mcdTT='mvnd clean deploy -Dmaven.test.skip'
alias mp='mvnd package'
alias mpT='mvnd package -DskipTests'
alias mpTT='mvnd package -Dmaven.test.skip'
alias mve='mvnd verify'
alias mcv='mvnd clean verify'
alias mcve='mvnd clean verify'
alias mpld='mvnd package liberty:dev'
alias mpldT='mvnd package liberty:dev -DhotTests'
alias mcpld='mvnd clean package liberty:dev'
alias mcpldT='mvnd clean package liberty:dev -DhotTests'
alias mld='mvnd liberty:dev'
alias mldT='mvnd liberty:dev -DhotTests'
alias mcp='mvnd clean package'
alias mcpT='mvnd clean package -DskipTests'
alias mcpTT='mvnd clean package -Dmaven.test.skip'
alias mqd='mvnd compile quarkus:dev'
alias mcqd='mvnd compile quarkus:dev'
alias mccqd='mvnd clean compile quarkus:dev'
alias mit='mvnd test-compile failsafe:integration-test failsafe:verify'
alias mc='mvnd clean'
alias mct='mvnd clean test'
alias mgs='mvnd generate-sources'
alias mrr='mvnd release:prepare release:perform -DperformRelease=true -DignoreSnapshots=false'
alias mgat='mvnd io.gatling:gatling-maven-plugin:execute'



# TMUX
alias tad="tmux a -t dotfiles"


# Docker
alias d="docker"
alias dp='docker ps'


# Zoxide
ialias cd="z"


# LSD 
alias ls="lsd"
alias l="ls -a"
alias ll="ls -l"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'



# Kubernetes
alias kctx="kubectx"
ialias k="kubecolor"
alias kaf='k apply -f'
alias kca='_kca(){ k "$@" --all-namespaces;  unset -f _kca; }; _kca'
alias kccc='k config current-context'
alias kcdc='k config delete-context'
alias kcgc='k config get-contexts'
alias kcn='k config set-context --current --namespace'
alias kcp='k cp'
alias kcsc='k config set-context'
alias kctx=kubectx
alias kcuc='k config use-context'
alias kdcj='k describe cronjob'
alias kdcm='k describe configmap'
alias kdd='k describe deployment'
alias kdds='k describe daemonset'
alias kdel='k delete'
alias kdelcj='k delete cronjob'
alias kdelcm='k delete configmap'
alias kdeld='k delete deployment'
alias kdelds='k delete daemonset'
alias kdelf='k delete -f'
alias kdeli='k delete ingress'
alias kdelj='k delete job'
alias kdelno='k delete node'
alias kdelns='k delete namespace'
alias kdelp='k delete pods'
alias kdelpvc='k delete pvc'
alias kdels='k delete svc'
alias kdelsa='k delete sa'
alias kdelsec='k delete secret'
alias kdelss='k delete statefulset'
alias kdi='k describe ingress'
alias kdj='k describe job'
alias kdno='k describe node'
alias kdns='k describe namespace'
alias kdp='k describe pods'
alias kdpvc='k describe pvc'
alias kdrs='k describe replicaset'
alias kds='k describe svc'
alias kdsa='k describe sa'
alias kdsec='k describe secret'
alias kdss='k describe statefulset'
alias kecj='k edit cronjob'
alias kecm='k edit configmap'
alias ked='k edit deployment'
alias keds='k edit daemonset'
alias kei='k edit ingress'
alias kej='k edit job'
alias keno='k edit node'
alias kens='k edit namespace'
alias kep='k edit pods'
alias kepvc='k edit pvc'
alias kers='k edit replicaset'
alias kes='k edit svc'
alias kess='k edit statefulset'
alias keti='k exec -t -i'
alias kga='k get all'
alias kgaa='k get all --all-namespaces'
alias kgcj='k get cronjob'
alias kgcm='k get configmaps'
alias kgcma='k get configmaps --all-namespaces'
alias kgd='k get deployment'
alias kgda='k get deployment --all-namespaces'
alias kgds='k get daemonset'
alias kgdsw='kgds --watch'
alias kgdw='kgd --watch'
alias kgdwide='kgd -o wide'
alias kgi='k get ingress'
alias kgia='k get ingress --all-namespaces'
alias kgj='k get job'
alias kgno='k get nodes'
alias kgns='k get namespaces'
alias kgp='k get pods'
alias kgpa='k get pods --all-namespaces'
alias kgpall='k get pods --all-namespaces -o wide'
alias kgpl='kgp -l'
alias kgpn='kgp -n'
alias kgpvc='k get pvc'
alias kgpvca='k get pvc --all-namespaces'
alias kgpvcw='kgpvc --watch'
alias kgpw='kgp --watch'
alias kgpwide='kgp -o wide'
alias kgrs='k get replicaset'
alias kgs='k get svc'
alias kgsa='k get svc --all-namespaces'
alias kgsec='k get secret'
alias kgseca='k get secret --all-namespaces'
alias kgss='k get statefulset'
alias kgssa='k get statefulset --all-namespaces'
alias kgssw='kgss --watch'
alias kgsswide='kgss -o wide'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'
alias kl='k logs'
alias kl1h='k logs --since 1h'
alias kl1m='k logs --since 1m'
alias kl1s='k logs --since 1s'
alias klf='k logs -f'
alias klf1h='k logs --since 1h -f'
alias klf1m='k logs --since 1m -f'
alias klf1s='k logs --since 1s -f'
alias kpf='k port-forward'
alias krh='k rollout history'
alias krsd='k rollout status deployment'
alias krsss='k rollout status statefulset'
alias kru='k rollout undo'
alias ksd='k scale deployment'
alias ksss='k scale statefulset'
