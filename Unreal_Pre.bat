set UnrealFile="D:\Eagle3D\task\unreal.exe"
set UnrealURL="https://www.dropbox.com/scl/fi/9of1zu5y45l678w5u8uox/UEPrereqSetup_x64-5.5.exe?rlkey=jn5h5n1s5obarw767hg9czbdv&e=1&st=ygwqm84v&dl=0"

curl -L -o  %UnrealFile% %UnrealURL%

start /wait "" %UnrealFile% /S /v"/qn ACCEPT_EULA=YES"