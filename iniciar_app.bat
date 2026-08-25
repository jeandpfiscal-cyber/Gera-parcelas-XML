@echo off
cd /d "%~dp0"

echo Verificando dependencias...
pip install -r requirements.txt

echo.
echo Iniciando o aplicativo...
streamlit run app.py

pause
