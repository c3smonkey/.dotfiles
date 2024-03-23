local Build = {}

function Build.build_project()
  local project_type = Build.detect_project_type()
  if project_type == "maven" then
    local mvn_command = Build.check_for_mvnd() or "mvn"
    vim.cmd("! " .. mvn_command .. " package")
  else
    vim.cmd("! ./gradlew build")
  end
end

function Build.run_project()
  local project_type = Build.detect_project_type()
  if project_type == "maven" then
    local mvn_command = Build.check_for_mvnd() or "mvn"
    vim.cmd("! " .. mvn_command .. " spring-boot:run")
  else
    vim.cmd("! ./gradlew bootRun")
  end
end

function Build.detect_project_type()
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

function Build.check_for_mvnd()
  -- Check if mvnd is available in the system
  local mvnd_exists = vim.fn.executable("mvnd") == 1
  if mvnd_exists then
    return "mvnd"
  else
    return nil
  end
end

return Build
