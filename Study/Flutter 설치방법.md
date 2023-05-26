## flutter 설치

- chocolatey 검색 

- https://chocolatey.org/install 들어가서 
- powershell 에서 관리자 모드로 실행
- `Get-ExecutionPolicy`. 
- `Restricted`, 이거 뜨면
-  `Set-ExecutionPolicy AllSigned` 작성
- Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) 설치
- choco install flutter 하기

옆에 탭에서 

- android Studio 설치
- 그리고 next후 설치 



위에 단계를 하면 오류가 나서 안됨

- 압축파일을 풀고 
- 시스템 환경 변수에서 => 환경 변수 => PATH길 설정
- visual studio C++ C 설치
- android Studio => 새로운프로젝트 만드는 페이지에서 more actions => sdk manager
- sdk Tools =>Android SDk command-line Tools(latest), Google USB Driver 설치

-  flutter doctor --android-licenses 입력 그다음 다 y(동의)

flutter doctor windows version (unable to confirm if installed windows version is 10 or greater)

- flutter channel master
- flutter upgrade

## 오류

```dart
Entrypoint isn't within the current project

FAILURE: Build failed with an exception.

* What went wrong:
Directory 'C:\Users\SSAFY\Desktop\S08P31B308\another_front' does not contain a Gradle build.

A Gradle build should contain a 'settings.gradle' or 'settings.gradle.kts' file in its root directory. It may also contain a 'build.gradle' or 'build.gradle.kts' file.

To create a new Gradle build in this directory run 'gradle init'

For more detail on the 'init' task see https://docs.gradle.org/7.4/userguide/build_init_plugin.html

For more detail on creating a Gradle build see https://docs.gradle.org/7.4/userguide/tutorial_using_tasks.html

* Try:
> Run gradle init to create a new Gradle build in this directory.
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.

* Get more help at https://help.gradle.org

BUILD FAILED in 21ms


flutter run으로 해결 // 해결못함
```

## APK 다운

1. 컴퓨터로 웹사이트에 들어가서 워치apk 다운로드 버튼을 누릅니다.
2. cmd 창을 열고 다음과 같이 명령어를 입력합니다.

"default adb 경로 : "C:\Users{username}\AppData\Local\Android\Sdk\platform-tools" "

"워치에 보여지는 포트번호" : https://igotit.tistory.com/2954

````
cd "adb 경로"
adb connect "워치에 보여지는 포트번호"
cd "다운로드 받은 watch.apk 경로"
adb install -r watch.apk
adb -s emulator-5555(devices 이름) install app-release.apk
````

