@echo off
echo ========================================
echo   Сборка и запуск RacerGame
echo ========================================
echo.

echo [1/3] Очистка старых файлов...
if exist "target" rmdir /s /q target
if exist "lib\com" rmdir /s /q "lib\com"

echo [2/3] Установка desktop-game-engine...
call mvn initialize

echo [3/3] Сборка FAT JAR с JavaFX...
call mvn clean package -DskipTests

echo.
if exist "target\project-maven-1.0.jar" (
    echo Проверка размера JAR...
    for %%I in ("target\project-maven-1.0.jar") do (
        set /a size=%%~zI/1024/1024
        echo Размер: !size! МБ
    )

    echo.
    echo ========================================
    echo   ЗАПУСК ИГРЫ
    echo ========================================
    echo.

    java -jar target\project-maven-1.0.jar
) else (
    echo ОШИБКА: JAR не создан!
)

echo.
pause