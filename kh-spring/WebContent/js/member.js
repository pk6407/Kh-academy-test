/**
 *    회원 관리에 관련된 스크립트
 *   작성자 : 김남호
 *   작성일 : 2020.12
 */

 function getID(id) {
    return document.getElementById(id)
 }
 
 
 var member = function() {
    
    var btnInsert = getID('btnInsert');
    var btnFind = getID('btnFind');
    var btnSelect = getID('btnSelect');
    var btnSave = getID('btnSave');
    var btnFindZip = getID('btnFindZip');
    var btnPhoto = getID('btnPhoto');
    var btnModify = getID('btnModify');
    var btnUpdate = getID('btnUpdate');
   var btnDelete = getID('btnDelete');
   
   //---------------------view에서 삭제버튼 클릭시 삭제 기능---------------------
   if(btnDelete != null){
      btnDelete.onclick = function(){
         var frm = document.frm_member;
        // var pwd = prompt("회원정보를 삭제하시려면 암호를 입력하세요.");
        var win = window.open('./member/input_pwd.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px');
        
        win.onbeforeunload = function(){
         if(frm.pwd.value != ''){
            frm.action = 'delete.mem';
            //frm.pwd.value = pwd;
            frm.mid.disabled=false;
            frm.submit();
         }            
        }
      }
   }
   
    if(btnUpdate != null){
       btnUpdate.onclick = function(){
          var frm = document.frm_member;
         var win = window.open('./member/input_pwd.jsp', 'win', 'width=400px, height=100px, left=300px, top=300px');
         win.onbeforeunload = function(){
               if(frm.pwd.value != ''){
             frm.enctype= 'multipart/form-data';
             frm.action = 'update.mem'; //수정된 정보를 저장
             frm.submit();
            }
         }
       }
    }

    if(btnModify != null){
       btnModify.onclick = function(){
          var frm = document.frm_member;
          frm.mid.disabled=false;
          frm.action = 'modify.mem'; //수정화면으로 이동
          frm.submit();
       }
    }
    
    // 이미지 파일 미리보기
    if(btnPhoto != null){
       btnPhoto.onchange = function(ev){
          var tag = ev.srcElement; //이벤트 발생한 태그
          var url =tag.files[0];
          var reader = new FileReader();
          reader.readAsDataURL(url);
          reader.onload = function(e){
             var img = new Image();
             img.src = e.target.result;
             var photo = getID('photo');
             photo.src = img.src;
          }
       }
    }
    
    
    
    //다음 우편번호 검색 API를 사용한 주소 찾기
    if(btnFindZip != null){
       btnFindZip.onclick = function(){
          var frm = document.frm_member;
          new daum.Postcode({
             oncomplete : function(data){
                frm.zipcode.value = data.zonecode;
                frm.address.value = data.address;
             }
          }).open();
          
          
       }
    }
    
    
    if(btnSave != null){
       btnSave.onclick = function(){
          var frm = document.frm_member;
          var checkFlag =true;
          
          if(!frm.mid.checkValidity()){
             alert('mid');
             checkFlag=false;
          }else if(!frm.name.checkValidity()){
             alert('name');
             checkFlag=false;
          }else if(!frm.pwd.checkValidity()){
             alert('pwd');
             checkFlag=false;
          }else if(!frm.email.checkValidity()){
             alert('email');
             checkFlag=false;
          }else if(!frm.phone.checkValidity()){
             alert('phone');
             checkFlag=false;
          }
          
          //암호와 암호확인의 일치여부
          if(frm.pwd.value != frm.pwdConfirm.value){
             alert("암호를 확인하세요");
             return;
          }
          
          //파일 업로드를 위해선 반드시 저 코드를 사용해야하는데 사용시 request.getParameter()를 통해서 form에 있는 데이터를 처리할 수 없기에          
          //cos.jar lib 다운받아서 사용해야만 아래 코드가 작동한다. <1222 스샷필기 확인>
          if(checkFlag){
             frm.enctype = 'multipart/form-data';
            frm.action = 'insertR.mem';
            frm.submit();
          
          }
       }
    }
    
    if(btnSelect != null){
       btnSelect.onclick = function(){
          var frm = document.frm_member;
          // Servlet 이후 이런식으로 변경할것 frm.action ='member.do?inc=select'
          // frm.action = url + 'select.jsp';   
          frm.action = 'select.mem';
          frm.submit();
       }
    }
   
   if(btnFind != null){
      btnFind.onclick =function() {
         var frm = document.frm_member;
         // Servlet 이전 frm.action = url + 'select.jsp'; 아래 코드는 Servlet 이후 변경 코드
         frm.action = "select.mem";
         frm.nowPage.value = 1;
         frm.submit();
      }
   }    
    
    
    //$('#btnInsert').on('click',function(){...});
    if(btnInsert != null) {
       btnInsert.onclick = function() {
          var frm = document.frm_member;
          frm.action = 'insert.mem';
          frm.submit();
       }
    }
 }
 
 function goPage(page) {
    var frm = document.frm_member;
    //frm.action = 'index.jsp?inc=./member/select.jsp'; Servlet 이전 밑에 코드는 Servlet 이후
    frm.action = 'select.mem';   
    frm.nowPage.value = page;
    frm.submit();
 }
 
 function view(mid){
    var frm =document.frm_member;
    frm.action = 'view.mem'; //frm.action = 'index.jsp?inc=./member/view.jsp'
    frm.mid.value = mid;
    frm.submit();
 }