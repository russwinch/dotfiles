function venv_new
    python -m venv ~/venvs/$argv[1]
    venv $argv[1]
end
