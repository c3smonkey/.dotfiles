local M = {}

function M.build_project()
  local project_type = M.detect_project_type()
  if project_type == "maven" then
    vim.cmd("!mvn clean install")
  else
    vim.cmd("!./gradlew build")
  end
end

function M.detect_project_type()
  local maven_exists = vim.fn.filereadable("pom.xml") == 1
  local gradle_exists = vim.fn.filereadable("settings.gradle") == 1
  local gradle_kts_exists = vim.fn.filereadable("settings.gradle.kts") == 1

  if maven_exists then
    return "maven"
  elseif gradle_exists or gradle_kts_exists then
    return "gradle"
  else
    return "unknown"
  end
end

return M
