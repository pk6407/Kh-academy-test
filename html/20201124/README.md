# java Servlet 20201124

## 오늘 해볼 것

1. 서버 띄우고
2. 도메인 연결(DNS)
3. HTTPS 적용

# 1. 서버 띄우기 

클라우드 서비스 사용해서 서버 띄우기

https://www.vultr.com/ (실패 - 학원IP 락 걸림)

보통 회사에서는 CentOS 많이 사용한다.
도쿄 / ubuntu(우분투) 20.10 x64 5$ 구입해서 실습진행하면 된다
ICMP cmd에서 ping 보내서 서버 띄어졌는지 확인 가능.
다시 성공해서 view controller에서 사용자 생성 아이디 비밀번호 적고 이름적고 전부enter and 마지막 Y
Mobaxterm 설치해서 이걸 이제 사용
`sudo vim /etc/sudoers`  

kh12kh34 비밀번호


https://www.digitalocean.com/ (강사님이 서버띄어주시고 실습)
Mobaxterm 사용해서 바로 받은 

클라우드 서비스

- AWS(아마존)
- GCP(구글)
- Azure(마소)
- vultr
- digital ocean

김남호 서버주소 141.164.42.235

비밀번호
pz51892@

유저생성 아이디와 비밀번호 설정 후 나머지 전부 enter and Y

유저아이디 pk6407
비밀번호 :pz51892@

`sudo vim /ete/sudoers` 해서 사용자 관리자권한 실행 위한 설정
i 눌러서 insert 모드 들어가면 user privilege specification에 
yskim ALL=(ALL:ALL) ALL 입력 후 enter 그리고 exit 누르면 입력창 나가짐
그리고 :wq! 입력하고 enter 치면 저장하고 나가겠다는 의미로 셋팅 권한설정 후 나가짐

콘솔창 한번 정리후 나간 후 다시 session 눌러서 아이피 주소 입력 후 이번엔 이름에 root 가 아닌
생성한 유저로 pk6407 입력 후 다시 ok 눌러서 들어가면 master yckim으로 들어가짐
비밀번호 pz51892@ 입력 후 

`sudo apt-get install -y nginx` 입력 그리고 엔터 비밀번호 입력 pz51892@

그러면 다운로드 받아지면서 셋팅 완료됨.

`sudo apt update` 입력 엔터치면 우분투에서 사용하는 open source와 사용할 수 있는 앱 등을 다운로드 받고 list update 되어진다(?)

`sudo apt-get install -y openjdk-8-jdk`  - openjdk 8버전 다운로드 받게 된다

다운로드 완료 후 `java -version` 입력했을 때 openjdk version 1.8 뜬다면 이제 서버에 인스톨 할 것은 끝나고 자바를 업로드 할 수 있게 된 것을 확인한 것이다.


`yckim@ubuntu-s-1vcpu-1gb-sgp1-yckim:~$` home 경로로 설정을 한후
`mkdir app` 입력하면 app폴더 만들어짐 그리고 `ll(영어)` 쳐서 확인 후 사이드바 setting 창에서 새로고침하고 app 폴더 만들어졌으면 거기에 만든 jar app 을 드래그 해서 올리고 업로딩 다 되었으면 
`cd app/` 해서 app으로 이동 후 `ls` 입력해서 들어가있는 jar app 확인.
확인 완료되었으면 이름이 기니까 바꿀것 `mv` + `tab 눌러서 들어가있는 application 이름` + `새로 바꿀 이름 app.jar` 입력해서 enter 그리고 `ls` 다시 눌르면 이름 바뀐 것을 확인할 수 있다.

`mv`는 원래 파일을 이동시키는 명령어이지만 이를 이용해서 파일이름을 변경할 수도 있다.
`mkdir` 은 디렉토리 만드는 명령어이다.
`rmdir` 은 지우는 명령어이다
`cd app/` app디렉토리로 이동한다
`cd ..` 전 디렉토리로 이동한다
`cd ~` home 경로로 이동하게 된다.


`yckim@ubuntu-s-1vcpu-1gb-sgp1-yckim:~$`


`java - jar app.jar` 입력하면 서버에 올라가게 된다. 
인터넷 들어가서 `http://128.199.124.229:8080/`
구입해서 할당 받은 서버번호 + :등록한port번호 식으로 입력하면 업로드 한 app.jar (java app)가 인터넷에 올라가서 확인할 수 있게 된다. 여기까지 완료했지만 아직 도메인에 연결된 것은 아니다. 

cmd 창에서 `nslookup` 쳐보면 나의 DNS 주소 확인 할 수 있다.
 


<sudo : 최고 권한자 (관리자)
명령문 앞에 sudo를 쳐주면 프리패스 가능 
vim 은 텍스트 에디터: 이것저것 편집 가능(txt부터, 프로그래밍까지)

sudo vim /etc/sudoers
- 난 관리자 권한으로 vim 이라는 에디터를통해
etc 폴더에 있는 sudoers를 편집할거야

sudoers 는 계정의 권한 설정에 대한 부분이라고 추측됨 >


# 2. 도메인 구입 연결(DNS)

1. 주소창에 도메인(https://google.com) 입력 
2. 로컬(자신의 컴퓨터) 머신에 등록된 DNS에게 해당 도메인 질의(query)
   1. 해당 DNS에 캐싱되어 있으면 바로 응답
   2. 없으면 사우이 네임 서버에 물어봄
3. 응답받은 IP 주소로 통신 (TCP/IP)


gabia.com 에서 shop 도메인 구매(1년)  `youcold.shop` 도메인 구입함

cmd 창에서 `ipconfig /flushdns`로 DNS 한번 컴퓨터에 있는 것들 flush하고 `ping youcold.shop` 입력하면 응답해준다. 그럼 도메인 구입하여 배포된 것 성공.



# 3. HTTPS 적용

https://letsencrypt.org/ko/
https://certbot.eff.org/ 
여기서 https:// 를 무료로 연결시켜준다.


`sudo snap install core`

`sudo snap refresh core`

`sudo snap install --classic certbot`

`sudo ln -s /snap/bin/certbot /usr/bin/certbot`

`ll(영어) /usr/bin/certbot`

`sudo certbot --nginx`
이메일 확인할 수 있는 이메일 입력
A
Y
입력한 후 
내가 할당받아 구입한 domain 주소 `youcold.shop` 입력하면 HTTPS(보안연결 인증서) 적용 성공!

`reverse proxy`(애플리케이션과 연결 과정) 이제 youcold.shop 들어갔을 때 nginx가 뜨는 것이 아닌 만들어놓은 이전에 업로딩한 app.jar이 돌아갈 수 있게끔 연결 시켜주는 리버스 프록시 과정을 시행하여야 한다.


`cd /etc/nginx/sites-available/` 여기로 이동후 `ls` 하면 default 라는 값이 보일것이다.
여기부터 이제 시작!


/etc/nginx/sites-available/ 이 경로의 default를 수정할 것이기에 바탕화면에 다운로드를 받은 후 vscode로 수정작업


```text
upstream todo-app {
	server 127.0.0.1:8080;
}

server {
	listen 80 default_server;
	listen [::]:80 default_server;

	
	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		proxy_pass http://todo-app;
	}

}

# HTTPS
server {

	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;
    server_name youcold.shop; # managed by Certbot


	location / {
		proxy_pass http://todo-app;
	}


    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/youcold.shop/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/youcold.shop/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = youcold.shop) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	listen 80 ;
	listen [::]:80 ;
    server_name youcold.shop;
    return 404; # managed by Certbot


}
```

default 파일 위와 같이 수정한 후 저장.
바로 Mobaxterm으로 import 시켜주고 싶지만 안되기에 다음의 과정을 거쳐서 수정한 default를 덮어씌울 것이다.


`sudo cp default default.bak` 해서 default 백업버전을 만들어 놓은 후 `ls`로 백업파일 생겼는지 확인 후 

default 수정 작업에 들어갈 것이다.


i 누르면 insert 모드

`%d!` default 수정하기위해 전부 지우기 위한 명령어

`shift + insert키` 붙여넣기 

위에서 수정한 default code를 복사 한 후 전부 비운 default 파일에 다시 붙여넣기 하여 덮어 씌운 후 

`:qw!` 저장 후 나가짐

exit 누르면 나가진다 


전부 완료된 후 `sudo nginx -t` 해서 ok successful 뜨면 완료 

`sudo systemctl reload nginx` 하면 아무런 일도 일어나지 않아야 정상

그 후 `cd ~`로 home으로 이동 후 `cd app/`으로 가서 `ls` 에서 `app.jar`있는지 확인 후
`java -jar app.jar` 하면 spring 뜨면서 다운로드 및 앱을 실행시키는 작업 과정을 거치게 되고 나의 도메인에서
nginx 로 연결되는 것이 아닌 app.jar 가 연결된다.

1. 프로세스 목록
ps -aux

2. 프로세스 목록에서 원하는 프로그램 
예) 자바 찾기

ps -aux | grep java

3. 프로세스 죽이기

kill -9 <pid>

4. 백그라운드로 프로세스 실행

nohup <실행할 명령 라인> &

nohup java -jar app.jar &


