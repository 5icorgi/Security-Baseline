@echo off
title Windows ��ȫ�ӹ̽ű�

echo [Unicode]>win.inf
echo Unicode=yes>>win.inf
echo [System Access]>>win.inf

@Rem �������븴�ӶȲ���
echo **** �������븴�ӶȲ���
echo PasswordComplexity = 1 >>win.inf

@Rem �������볤����СֵΪ12
echo **** �������볤����СֵΪ12
echo MinimumPasswordLength = 12 >>win.inf

@Rem ���Ĺ���Ա�˻�����Ϊadmin
echo **** ���Ĺ���Ա�ʻ�����Ϊadmin
echo NewAdministratorName = "****_admin" >>win.inf

@Rem �����ʻ�������ֵΪ10����ѡ��
@Rem echo **** �����ʻ�������ֵΪ10����ѡ��
@Rem echo LockoutBadCount = 10>>win.inf

@Rem ���á�ǿ��������ʷ��
echo **** ��ס3����ʹ�õ�����
echo PasswordHistorySize = 3 >>win.inf

@Rem ɾ������ø�Σ�˻�
echo **** ����Guest�û�
echo EnableGuestAccount = 0 >>win.inf

@Rem ���á���λ�ʻ�������������ʱ��
echo **** 5���Ӻ������ʻ�����������
echo ResetLockoutCount = 5 >>win.inf

@Rem �����ʻ�����ʱ��
echo **** �����ʻ�����ʱ��Ϊ5����
echo LockoutDuration = 5 >>win.inf

@Rem ���������ʹ�����ޣ���ѡ��
@Rem echo **** ����180��������루��ѡ��
@Rem echo MaximumPasswordAge = 180 >>win.inf

echo [Event Audit]>>win.inf
@Rem ������־��˲���
echo **** ������־��˲���
echo AuditSystemEvents = 3 >>win.inf
echo AuditLogonEvents = 3 >>win.inf
echo AuditObjectAccess = 3 >>win.inf
echo AuditPrivilegeUse = 3 >>win.inf
echo AuditPolicyChange = 3 >>win.inf
echo AuditAccountManage = 3 >>win.inf
echo AuditProcessTracking = 3 >>win.inf
echo AuditDSAccess = 3 >>win.inf
echo AuditAccountLogon = 3 >>win.inf

@Rem ��ȷ����Windows��־
echo **** ��ȷ����Windows��־������־�ļ�����128Mʱ���踲���¼���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System" /v MaxSize /t REG_DWORD /d 0x8000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System" /v Retention /t REG_DWORD /d 0x00000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application" /v MaxSize /t REG_DWORD /d 0x8000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application" /v Retention /t REG_DWORD /d 0x00000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security" /v MaxSize /t REG_DWORD /d 0x8000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security" /v Retention /t REG_DWORD /d 0x00000000 /f



echo [Privilege Rights]>>win.inf
@Rem ���ƿɹر�ϵͳ���ʻ�����
echo **** ���ý���Administrators���û���ɹر�ϵͳ
echo SeShutdownPrivilege = *S-1-5-32-544 >>win.inf

@Rem ���ƿɴ�Զ�˹ر�ϵͳ���ʻ�����
echo **** ���ý���Administrators���û���ɴ�Զ�˹ر�ϵͳ
echo SeRemoteShutdownPrivilege = *S-1-5-32-544 >>win.inf

@Rem ���ơ�ȡ���ļ����������������Ȩ�����ʻ�����
echo **** ���ý���Administrators���û����ȡ���ļ����������������Ȩ
echo SeTakeOwnershipPrivilege = *S-1-5-32-544 >>win.inf

@Rem ���á������ص�¼������
echo **** ���ý���Administrators���͡�Users���û���ɱ��ص�¼
echo SeInteractiveLogonRight = *S-1-5-32-544,*S-1-5-32-545 >>win.inf

@Rem ���á���������ʴ˼����������
echo **** ���ý���Administrators���͡�Users���û���ɴ�������ʴ˼����
echo SeNetworkLogonRight = *S-1-5-32-544,*S-1-5-32-545 >>win.inf

@Rem ɾ�����������ʵĹ���������ܵ�
echo **** �����������: ���������ʵĹ��������������: ���������ʵ������ܵ���������Ϊ��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v NullSessionShares /t REG_MULTI_SZ /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" /v NullSessionPipes /t REG_MULTI_SZ /f

@Rem ���������û�����
echo **** �����������: ������ SAM �ʻ��͹��������ö�١������������: ������ SAM �ʻ�������ö�١�������Ϊ�����á�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymoussam /t REG_DWORD /d 0x00000001 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymous /t REG_DWORD /d 0x00000001 /f

@Rem ����SNMP�����Ĭ��public���壨���Ȱ�װSNMP�����Զ���password��IP��
echo **** �޸�SNMP������Ϊ��password��ָ������ˣ�129.25.98.221
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" /v password /t REG_DWORD /d 0x00000004 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" /v 1 /t REG_SZ /d IP /f

@Rem �ر�Windows�Զ�����
echo **** ���á��ر��Զ����Ų��ԡ��Ҷ�������������Ч
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f

@Rem ��ֹWindows�Զ���¼
echo **** ��ֹWindows�Զ���¼
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f

@Rem ��ȷ���á������Ựʱ��ʾ�û���Ϣ������
echo **** ���������Ựʱ����ʾ�û���Ϣ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DontDisplayLockedUserId /t REG_DWORD /d 0x00000003 /f

@Rem ��ȷ���á���ʾ�û����������֮ǰ���и��ġ�����
echo **** �������������ǰ14����ʾ��������
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v PasswordExpiryWarning /t REG_DWORD /d 0x0000000e /f

@Rem ����Windows����Ĭ�Ϲ���
echo **** ɾ��������Windows����Ĭ�Ϲ���
for /f "tokens=1 delims= " %%i in ('net share') do (
net share %%i /del ) >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v AutoShareServer /t REG_DWORD /d 0x00000000 /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v AutoShareWks /t REG_DWORD /d 0x00000000 /f

@Rem �����ļ��е�Ȩ�����ã�����ά��Ա�ο���
echo **** �������ļ����С�Everyone(�κ���)��Ȩ��ɾ��
for /f "tokens=2" %%i in ('net share') do (
cacls %%i /r "everyone" /e ) >nul 2>nul

@Rem ����Windows����ִ�б���(DEP)
echo **** ���ý�Ϊ����Windows����ͷ�������DEP
@Rem Server 2008:
bcdedit /set nx OptIn
@Rem Server 2003:
@Rem /noexecute=optin

@Rem ���á�����ʾ����û���������
echo **** ���õ�¼��Ļ�ϲ�Ҫ��ʾ�ϴε�¼���û���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Currentversion\Policies\System" /v DontDisplayLastUserName /t REG_DWORD /d 0x00000001 /f

@Rem ���ò���ȷ����WSUS���Զ���WSUS��ַ��
echo **** ���ò���ȷ����WSUS���Զ����ز�֪ͨ��װ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 0x00000003 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://WSUS /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://WSUS /f

@Rem ���ò���ȷ������Ļ��������
echo **** ������Ļ�������򣬵ȴ�ʱ��Ϊ5���ӣ��������ڻָ�ʱ��Ҫ���뱣��
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d C:\Windows\system32\scrnsave.scr /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d 300 /f

@Rem ���á���¼ʱ���밴 Ctrl+Alt+Del������
echo **** ������ʽ��¼: ����(����Ҫ)�� Ctrl+Alt+Del��������Ϊ���ѽ���(ͣ��)��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Currentversion\Policies\System" /v disablecad /t REG_DWORD /d 0x00000000 /f

@Rem ���ò���Ҫ�ķ���
echo **** �������·���Windows Internet Name Service (WINS)��Remote Access Connection Manager��Simple TCP/IP Services��Simple Mail Transport Protocol (SMTP) ��DHCP Client��DHCP Server��Message Queuing
wmic service where name="SimpTcp" call stopservice >nul 2>nul
sc config "SimpTcp" start= disabled >nul 2>nul
wmic service where name="SMTPSVC" call stopservice >nul 2>nul
sc config "SMTPSVC" start= disabled >nul 2>nul
wmic service where name="WINS" call stopservice >nul 2>nul
sc config "WINS" start= disabled >nul 2>nul
wmic service where name="RasMan" call stopservice >nul 2>nul
sc config "RasMan" start= disabled >nul 2>nul
wmic service where name="DHCPServer" call stopservice >nul 2>nul
sc config "DHCPServer" start= disabled >nul 2>nul
wmic service where name="DHCP" call stopservice >nul 2>nul
sc config "DHCP" start= disabled >nul 2>nul
wmic service where name="MSMQ" call stopservice >nul 2>nul
sc config "MSMQ" start= disabled >nul 2>nul

@Rem ��װ���²������Ͳ���
echo **** ����Ƿ�װ����
wmic qfe get hotfixid >nul 2>nul || echo ��δ��װ�������밲װ��

@Rem ���á��û��´ε�¼ʱ��������롱
echo **** ����administrator��admin���û��´ε�¼�����������
net user Administrator /logonpasswordchg:yes >nul 2>nul
net user ****_admin /logonpasswordchg:yes >nul 2>nul

echo [Version]>>win.inf
echo signature="$CHICAGO$">>win.inf
echo Revision=1 >>win.inf

secedit /configure /db win.sdb /cfg win.inf
del win.inf /q
del win.sdb /q

echo ������ɣ���������˳�
pause
goto exit