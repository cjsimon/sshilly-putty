@echo on

:LOGIN
:: Load variables from config file if it exists
if exist %1 (
	for /f "delims=" %%x in (%1) do (set "%%x")
) else (
	echo Config file does not exist!
	exit
)
:: Load data from the commands file if it exists
if exist %2 (
	set commands=%2
)

if [%port%] == [] (
	set port=
) else (
	set port=-P %port%
)
if [%password%] == [] (
	set password=
) else (
	set password=-pw %password%
)
if [%session%] == [] (
	set session=
) else (
	set session=-load %session%
)
if [%key%] == [] (
	set key=
) else (
	set key=-i %key%
)
if [%commands%] == [] (
	set commands=
) else (
	set commands=-m "%commands%" -t
)

putty -ssh %username%@%host% %port% %password% %session% %key% %commands%
