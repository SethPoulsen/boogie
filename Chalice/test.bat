@echo off
echo start > Output

set CHALICE=call scala -cp bin Chalice -nologo

for %%f in (AssociationList cell counter dining-philosophers ForkJoin HandOverHand
            iterator iterator2 producer-consumer
            prog0 prog1 prog2 prog3 prog4 RockBand swap GhostConst OwickiGries) do (
  echo   Testing %%f.chalice ...
  echo ------ Running regression test %%f.chalice >> Output
  %CHALICE% %* examples\%%f.chalice >> Output 2>&1
)

echo   Testing cell-defaults.chalice ...
echo ------ Running regression test cell-defaults.chalice >> Output
%CHALICE% %* -defaults -autoFold -autoMagic examples\cell-defaults.chalice >> Output 2>&1

echo   Testing RockBand-automagic.chalice ...
echo ------ Running regression test RockBand-automagic.chalice >> Output
%CHALICE% %* -defaults -autoMagic -checkLeaks -autoFold examples\RockBand-automagic.chalice >> Output 2>&1

echo   Testing Leaks.chalice ...
echo ------ Running regression test Leaks.chalice >> Output
%CHALICE% %* -checkLeaks examples\Leaks.chalice >> Output 2>&1


fc examples\Answer Output > nul
if not errorlevel 1 goto passTest
goto failTest

:passTest
echo Succeeded
goto end

:failTest
echo Failed
goto end

:errorEnd
exit /b 1

:end
exit /b 0
