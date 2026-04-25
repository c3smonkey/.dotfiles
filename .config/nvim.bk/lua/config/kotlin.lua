local ok_kotlin, kotlin = pcall(require, 'kotlin')

if ok_kotlin then
  kotlin.setup({
    root_markers = {
      'settings.gradle',
      'settings.gradle.kts',
      'build.gradle',
      'build.gradle.kts',
      'pom.xml',
      '.git',
    },
    inlay_hints = {
      enabled = true,
    },
  })
end
