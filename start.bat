@echo off
REM ============================================
REM 🚀 Alfaken Startup - Iniciar Servidor Local
REM ============================================

set PORT=%1
if "%PORT%"=="" set PORT=8080

echo.
echo ========================================
echo   ALFAKEN STARTUP - SERVIDOR LOCAL
echo ========================================
echo.

cd /d "%~dp0"

where python3 >nul 2>&1
if %errorlevel%==0 (
    echo Usando Python 3
    echo Acesse: http://localhost:%PORT%
    echo Para parar: Ctrl+C
    echo.
    python3 -m http.server %PORT%
    goto :end
)

where python >nul 2>&1
if %errorlevel%==0 (
    echo Usando Python
    echo Acesse: http://localhost:%PORT%
    echo Para parar: Ctrl+C
    echo.
    python -m http.server %PORT%
    goto :end
)

where npx >nul 2>&1
if %errorlevel%==0 (
    echo Usando npx serve
    echo Acesse: http://localhost:%PORT%
    echo Para parar: Ctrl+C
    echo.
    npx serve -l %PORT%
    goto :end
)

where php >nul 2>&1
if %errorlevel%==0 (
    echo Usando PHP
    echo Acesse: http://localhost:%PORT%
    echo Para parar: Ctrl+C
    echo.
    php -S localhost:%PORT%
    goto :end
)

echo Nenhum servidor encontrado!
echo Instale Python 3, Node.js ou PHP.
pause
exit /b 1

:end
pause
