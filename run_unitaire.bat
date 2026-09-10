@echo off

echo ========================================
echo TESTS UNITAIRES
echo ========================================

if not exist "tests_unitaire" (
    echo ERREUR : dossier tests_unitaire introuvable
    exit /b 1
)

if not exist "results" mkdir results

echo.
echo FICHIERS DE TEST :
dir tests_unitaire

echo.
echo EXECUTION DES TESTS UNITAIRES...

python -m unittest discover -s tests_unitaire -p "test_*.py" -v > results\results_unitaires.txt 2>&1

type results\results_unitaires.txt

if errorlevel 1 (
    echo.
    echo TESTS UNITAIRES : ECHEC
    exit /b 1
)

findstr /C:"Ran 0 tests" results\results_unitaires.txt >nul

if not errorlevel 1 (
    echo.
    echo ERREUR : AUCUN TEST UNITAIRE N'A ETE EXECUTE
    exit /b 1
)

echo.
echo TESTS UNITAIRES : SUCCES
exit /b 0

