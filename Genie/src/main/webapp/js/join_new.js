

    //#################################
    // Ajax 코드
    //#################################
    var IsfocusEmail=false;
    var IsfocusNickName=false;
    var IsfocusCustId=false;
    var IsfocusPwd = false;
//form
    function InputDataCheck_Ajax(o)
    {
        var baseparm;

        if ( o.id == 'PasswordVerify' ) {
            baseparm = 'cmd=check&id=' + o.id + '&strvalue=' + o.value + '&strvalue2=' + $( 'password' ).value;
        }
        else if ( o.id == 'hp1' || o.id == 'hp2' || o.id == 'hp3' ) {
            baseparm = 'cmd=check&id=' + o.id + '&strvalue=' + $( 'hp1' ).value + '-' + $( 'hp2' ).value + '-' + $( 'hp3' ).value;
        }
        else if ( o.id == 'tel1' || o.id == 'tel2' || o.id == 'tel3' ) {
            baseparm = 'cmd=check&id=' + o.id + '&strvalue=' + $( 'tel1' ).value + '-' + $( 'tel2' ).value + '-' + $( 'tel3' ).value;
        }
        else if ( o.id=='password' ) { 
            baseparm='cmd=check&id=' + o.id + '&strvalue=' + encodeURIComponent(o.value);
            
            if ( $( 'BirthYear' ) ) {
                baseparm += '&strvalue3=' + $('BirthYear').value + '-' + $('BirthMonth').value + '-' + $('BirthDay').value;
            } else if ( $( 'BirthYMD' ) ) {
                baseparm += '&strvalue3=' + $('BirthYMD').value; 
            }
            
            var objCN = $('CustomerName');
            if(!objCN){
                var objCNNameList = document.getElementsByName("CustomerName");
                if(objCNNameList && objCNNameList.length >= 1){
                    objCN = objCNNameList[0];
                 }
            }
            
            if(objCN) {
                baseparm += '&strvalue4=' + objCN.value;
            }
        }
        else if ( o.id == "Email" ) {
            var email = o.value;
            if ( $j( "#EmailDomain" ).val() != "0" && $j( "#EmailDomain" ).val() != "1" ){
                email = email + "@" + $j( "#EmailDomain" ).val();
            } else {
                email = email + "@" + $j("#EmailDomainText").val();
            }

            baseparm = 'cmd=check&id=Email&strvalue=' + encodeURIComponent( email );
        }
        else if (o.id == "EmailDomain") {
            var email = $j("#Email").val();
            if (o.value != "0" && o.value != "1") {
                email = email + "@" + $j("#EmailDomain").val();
            }
            else {
                email = email + "@" + $j("#EmailDomainText").val();
            }

            baseparm = 'cmd=check&id=Email&strvalue=' + encodeURIComponent(email);
        }
        else if (o.id == "EmailDomainText") {
            var email = $j("#Email").val();
            if ($j("#EmailDomain").val() != "0" && $j("#EmailDomain").val() != "1") {
                email = email + "@" + $j("#EmailDomain").val();
            } else {
                email = email + "@" + o.value;
            }

            baseparm = 'cmd=check&id=Email&strvalue=' + encodeURIComponent(email);
        }
        else if ( o.id == 'accountemail' ) {
            baseparm = 'cmd=check&id=' + o.id + '&strvalue=' + encodeURIComponent( o.value );
        }
        else {
            baseparm = 'cmd=check&id=' + o.id + '&strvalue=' + o.value;
        }
        
        Alajax.baseInvoke("/account/wjoin_check.aspx",baseparm,'2','',AjaxCallBack,AjaxFailBack,'euc-kr','get');
    }

    function AjaxCallBack(o)
    {
        var obj = $( o.Id );
        
        if (o.Id == 'accountemail' || o.Id == 'Email' || o.id == "EmailDomain" || o.id == "EmailDomainText")
        {
            EmailErrCheck( o.ResultCode );
            var result = $( get_id( obj ) + '_result' );
            
            result.innerHTML = o.ResultMsg;
            
            //결과가 성공이거나 focus가 떠나면 hide
            if ( IsfocusEmail ) {
                if ( o.ResultCode != '1' ) {
                    DisplayShow( get_id( obj ) + '_helplayer' );
                } else {
                    if ( o.ResultMsg == '' ) {
                        DisplayHide( get_id( obj ) + '_helplayer' );
                    } else {
                        DisplayShow( get_id( obj ) + '_helplayer' );
                    }
                }
            } else {
                DisplayHide( get_id( obj ) + '_helplayer' );
            }

        }
        else if (o.Id=='CustId')
        {
            CustIdErrCheck(o.ResultCode);
            var result = $(get_id(obj) + '_result');
            result.innerHTML = o.ResultMsg;
        
            //결과가 성공이거나 focus가 떠나면 hide
            if ( IsfocusCustId && o.ResultCode != '1' ) {
                DisplayShow( get_id( obj ) + '_helplayer' );
            } else {
                DisplayHide( get_id( obj ) + '_helplayer' );
            }

        }
        else if (o.Id=='CustomerNickName')
        {
            var result=$(get_id(obj) + '_result');
            result.innerHTML=o.ResultMsg;
            
            //결과가 성공이거나 focus가 떠나면 hide
            if ( IsfocusNickName && o.ResultCode != '1' ) {
                DisplayShow( get_id( obj ) + '_helplayer' );
            } else {
                DisplayHide( get_id( obj ) + '_helplayer' );
            }
        }
        else if (o.Id=='password')
        {
            PwdErrCheck(o.ResultCode);
            var result=$(get_id(obj) + '_result');
            result.innerHTML=o.ResultMsg;
        
            //결과가 성공이거나 focus가 떠나면 hide
            if (IsfocusPwd){
                if (o.ResultCode!='1'){
                    DisplayShow(get_id(obj) + '_helplayer');
                } else {
                    if(o.ResultMsg=='') {
                        DisplayHide(get_id(obj) + '_helplayer');
                    } else {
                        DisplayShow(get_id(obj) + '_helplayer');
                    }
                }           
            } else {
                DisplayHide(get_id(obj) + '_helplayer');
            }
        }       
    }

    function AjaxFailBack(o)
    {
        //alert(o);
    }

    function modalShow() {
        var $oLayer = $j( '#registLayer' );
        var email = $j( '#accountemail' ).val();

        try {
            
            $oLayer.find( '#linkEmail' ).val( email );
            $oLayer.find( '#lableEmail' ).text( email );
            $oLayer.modal( {
                onOpen: function ( dialog ) {
                    dialog.overlay.fadeIn( 'fast', function () {
                        dialog.container.slideDown( 'fast', function () {
                            dialog.data.fadeIn( 'fast' );
                            dialog.data.find( "#linkPassword" ).focus();
                        } );
                    } );
                }
            } );
        } catch ( e ) {

        }
    }

    function modalClose() {
        var $email = $j( '#accountemail' );
        $email.val( "" );
        $j.modal.close();
        $email.focus();
    }


    function EmailErrCheck(ResultCode)
    {
        var usa = $j("#USA"); // 누락되어서 추가 2016-06-03 by Gootooc
        objEmailCheck=$('EmailErrCheck');
        if ( ResultCode == '1' ) {
            objEmailCheck.value = '1';
        }
        else if (ResultCode == '300') { //NotAllowEmail
            objEmailCheck.value = '1';
        }
        else if ( ResultCode == '26' && usa.val() == 'True' ) { // 북몬스터 계정이면 연동 레이어 팝업을 띄운다.
            modalShow();
            objEmailCheck.value = '0';
        }
        else {
            objEmailCheck.value = '0';
        }
    }
    
    function CustIdErrCheck(ResultCode)    
    {
        objCustIdCheck = $( 'CustIdErrCheck' );

        if ( ResultCode == '1' ) {
            objCustIdCheck.value = '1';
        } else {
            objCustIdCheck.value = '0';
        }
    }
    
    function PwdErrCheck(ResultCode)    
    {
        objPwdErrCheck = $( 'PwdErrCheck' );

        if ( ResultCode == '1' ) {
            objPwdErrCheck.value = '1';
        } else {
            objPwdErrCheck.value = '0';
        }
    }

    //날짜 유효성 체크
    function chkDate(y,m,d){
        var err = 0;   //에러 변수
        var d_arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

        if ( y < 1000 ) {
            err = 1;
        }

        //윤년
        if ( y % 1000 != 0 && y % 4 == 0 ) {
            d_arr[1] = 29;
        }

        //날짜 체크
        if ( d > d_arr[m - 1] || d < 1 ) {
            err = 1;
        }

        //월 체크
        if ( m < 1 || m > 12 ) {
            err = 1;
        }
        //정수 체크
        if ( m % 1 != 0 || y % 1 != 0 || d % 1 != 0 ){
            err = 1;  
        }

        if ( err == 1 ) {
            return false;
        } else {
            return true;
        }

    }//end of chkDate


    //#################################
    // 테스트박스 CSS
    //#################################
    function InputFocusOn(o)
    {
        var USA = document.getElementById( "USA" );
        
        if (USA.value != 'True') {
            var CustomerType=$("CustomerType").value;
            var RetInfo = "";

            if ( CustomerType == 1 ){
                RetInfo = $("RetInfo").value;
            }
            else if(CustomerType == 3){
                RetInfo = $("RetInfo14").value;
            }
            
            if (CustomerType == 3 && RetInfo == "") {
                alert('법정 대리인이 본인 인증 및 회원가입에 동의하셔야 합니다.');
                o.blur();
                return false;
            }

            /*
            if (CustomerType == 3) {
                if (!document.getElementById("agrParent1").checked) {
                    alert('법정 대리인이 회원가입에 동의하셔야 합니다.');
                    o.blur();
                    return false;
                }
            }
            */

            //if((CustomerType == 1 || CustomerType == 3) && RetInfo == "") {
            //    alert('본인인증을 먼저 해주십시오.');
            //    o.blur();
            //    return false;
            //} else if ( ( CustomerType == 1 ) && RetInfo != "" && o.id == "CustomerName" ) {
            //    if ( confirm( "입력된 이름을 변경하시겠습니까?" ) ) {
            //        location.href = location.href;
            //    }
            //    else {
            //        document.getElementById( "CustId" ).focus();
            //        return false;
            //    }
            //}

        }
        
        InputFocusOnCSS(o);
        InputFocusOnHelpLayer(o);
        InputDataCheck( o, '0' )

        if (o.id == 'accountemail' || o.id == 'Email' || o.id == "EmailDomainText" || o.id == "EmailDomain") {
            IsfocusEmail = true;
        }

        if ( o.id == 'CustomerNickName' ) {
            IsfocusNickName = true;
        }

        if ( o.id == 'CustId' ) {
            IsfocusCustId = true;
        }

        if ( o.id == 'password' ) {
            IsfocusPwd = true;
        }
    }
    
    function InputFocusOut(o)
    {
       InputFocusOutCSS(o);
       InputFocusOutHelpLayer( o );

       if (o.id == 'accountemail' || o.id == 'Email' || o.id == "EmailDomainText" || o.id == "EmailDomain") {
           IsfocusEmail = false;
       }

       if ( o.id == 'CustomerNickName' ) {
           IsfocusNickName = false;
       }

       if ( o.id == 'CustId' ) {
           IsfocusCustId = false;
       }

       if ( o.id == 'password' ) {
           IsfocusPwd = false;
       }
    }
    
    function InputFocusOutWithDataCheck( o )
    {
        InputFocusOutCSS( o );
        InputFocusOutHelpLayer( o );

        if (o.id == 'accountemail' || o.id == 'Email' || o.id == "EmailDomainText" || o.id == "EmailDomain") {
            IsfocusEmail = false;
        }

        if ( o.id == 'CustomerNickName' ) {
            IsfocusNickName = false;
        }

        if ( o.id == 'CustId' ) {
            IsfocusCustId = false;
        }

        if ( o.id == 'password' ) {
            IsfocusPwd = false;
        }
    }

    /* 텍스트박스 스타일 */
    function InputFocusOnCSS( o ) {
        o.style.borderWidth = "2px";
        o.style.borderColor = "#978bdc";
        o.style.backgroundColor = "#f1f1f8";
        o.style.fontWeight = "bold";
        o.style.color = "#8378c6";
        o.style.height = "28px";
        o.style.padding = "0px 6px";
    }

    function InputFocusOutCSS( o ) {
        o.style.borderWidth = "1px";
        o.style.borderColor = "#999999 #DFDFDF #DFDFDF #999999";
        o.style.backgroundColor = "#EBEBEB";
        o.style.fontWeight = "";
        o.style.color = "#333333";
        o.style.height = "30px";
        o.style.padding = "0px 7px";
    }
    
    //도움말레이어(풍선도움말 Show/텍스트 도움말 Hide)
    function InputFocusOnHelpLayer( o ) {
        DisplayShow( get_id( o ) + '_helplayer' );
    }

    //도움말레이어(풍선도움말 Show/텍스트 도움말 Hide)
    function InputFocusOutHelpLayer( o ) {
        DisplayHide( get_id( o ) + '_helplayer' );
    }
    
    //보이기/감춤       
    function DisplayLayer( id, value ) {
        var o = $( id );
        if ( o != null ){
            o.style.display = value;
        }
    }

    function DisplayShow( id ) {
        DisplayLayer( id, 'block' );
    }

    function DisplayHide( id ) {
        DisplayLayer( id, 'none' );
    }
    
    
    function HelpLayer_result(o,ResultCode,ResultMsg)
    {
        o.innerHTML=ResultMsg;
    }

    function InputDataCheckResult(o,DisplayAlert,LayerMessage)
    {
        var result = $(get_id(o) + '_result');
        
        if ( result == null )
            return;
        
        if (LayerMessage != '') {
            
            result.innerHTML=LayerMessage;
            DisplayShow(get_id(o) + '_helplayer');
            
            if ( DisplayAlert == '1' ) {
                alert( LayerMessage.replace( '<br>', '' ) );
                o.focus();
            }

        } else {
            DisplayHide(get_id(o) + '_helplayer');
        }
    }

//    function InputDataCheckResult(o,ResultCode,ResultMsg)
//    {
//        var result=$(get_id(o) + '_result');
//        result.innerHTML=ResultMsg;
//        //말풍성 - Show or Hide
//        if (ResultCode=='1'){DisplayHide(get_id(o) + '_helplayer');}else{DisplayShow(get_id(o) + '_helplayer');}
//        
//        //alert박스인경우

//        if (bResultAlert && ResultCode!='1'){alert(ResultMsg.replace('<br>',''));o.focus();}
//    }




    //#################################
    // InputData Check
    //#################################
    function frmsubmit()
    {
        var bResultAlert=true;
        var DisplayAlert='1';
        var CustomerType=$("CustomerType").value;
        var USA=document.getElementById("USA");
        
        if (USA.value != 'True') {
            var RetInfo = "";

            if ( CustomerType == 1 ){
                RetInfo = $("RetInfo").value;
            }
            else if(CustomerType == 3){
                RetInfo = $("RetInfo14").value;
            }

            //if((CustomerType == 1 || CustomerType == 3) && RetInfo == "") {
            //    alert('본인인증을 먼저 해주십시오.');    
            //    return false;
            //}
        }
        
        if (USA.value=='True' || CustomerType=='2')
        {
            //이름
            if ( bResultAlert ) {
                var CustomerName = document.getElementById( "CustomerName" );
                bResultAlert = InputDataCheck( CustomerName, DisplayAlert );
            }
            
            //if (bResultAlert){var CustId=document.getElementById("CustId");bResultAlert=InputDataCheck(CustId,DisplayAlert);}

            //이메일

            if ( bResultAlert ) {
                var accountemail = document.getElementById( "accountemail" );
                bResultAlert = InputDataCheck( accountemail, DisplayAlert );
            }

            //비밀번호1
            if ( bResultAlert ) {
                var password = document.getElementById( "password" );
                bResultAlert = InputDataCheck( password, DisplayAlert );
            }

            //비밀번호2
            if ( bResultAlert ) {
                var PasswordVerify = document.getElementById( "PasswordVerify" );
                bResultAlert = InputDataCheck( PasswordVerify, DisplayAlert );
            }
            
            ////생년 - 체크 
            //if ( bResultAlert ) {
            //    var BirthYear = document.getElementById( "BirthYear" );
            //    bResultAlert = InputDataCheck( BirthYear, DisplayAlert );
            //}
            
            ////생월 - 체크 
            //if ( bResultAlert ) {
            //    var BirthMonth = document.getElementById( "BirthMonth" );
            //    bResultAlert = InputDataCheck( BirthMonth, DisplayAlert );
            //}
            
            ////생일 - 체크 
            //if ( bResultAlert ) {
            //    var BirthDay = document.getElementById( "BirthDay" );
            //    bResultAlert = InputDataCheck( BirthDay, DisplayAlert );
            //}
            
            ////성별 - 체크 
            //if ( bResultAlert ) {
            //    if ( !$( 'Sex1' ).checked && !$( 'Sex2' ).checked ) {
            //        alert( '성별을 선택하세요' );
            //        $( 'Sex1' ).focus();
            //        bResultAlert = false;
            //    }
            //}
            
            ////생년월일체크
            //if (bResultAlert)
            //{
            //    var BirthYear=2008; //날짜 유효성 체크를 위해 윤년인 2008년을 임의로 설정(2월 29일 허용)
            //    var BirthMonth=document.getElementById("BirthMonth");
            //    var BirthDay=document.getElementById("BirthDay");

            //    if (BirthMonth.value >0 ||  BirthDay.value >0)
            //    {
            //        if (!chkDate(BirthYear,BirthMonth.value,BirthDay.value))
            //        {
            //            alert('생일이 유효하지 않습니다. 생일을 다시 한번 확인해주세요~');
            //            bResultAlert=false;
            //            return false;
            //        }
            //    }
            //}
            
            //휴대전화번호
            if ( bResultAlert ) {
                var hp1 = document.getElementById( "hp1" );
                bResultAlert = InputDataCheck( hp1, DisplayAlert );
            }
            
        }        
        else if (CustomerType=='1') //일반회원
        {
            //이름
            if ( bResultAlert ) {
                var CustomerName = document.getElementById( "CustomerName" );
                bResultAlert = InputDataCheck( CustomerName, DisplayAlert );
            }
            
            //아이디 - 체크 
            if ( bResultAlert ) {
                var CustId = document.getElementById( "CustId" );
                bResultAlert = InputDataCheck( CustId, DisplayAlert );
            }

            //이메일 - 체크 
            if ( bResultAlert ) {
                var email = document.getElementById( "Email" );
                bResultAlert = InputDataCheck( email, DisplayAlert );
            }

            //비밀번호1 - 체크 
            if ( bResultAlert ) {
                var password = document.getElementById( "password" );
                bResultAlert = InputDataCheck( password, DisplayAlert );
            }

            //비밀번호2 - 체크 
            if ( bResultAlert ) {
                var PasswordVerify = document.getElementById( "PasswordVerify" );
                bResultAlert = InputDataCheck( PasswordVerify, DisplayAlert );
            }
            
            //휴대전화번호
            if ( bResultAlert ) {
                var hp1 = document.getElementById( "hp1" );
                bResultAlert = InputDataCheck( hp1, DisplayAlert );
            }
            
        }
        else if (CustomerType=='3')
        {
            if (bResultAlert) {
                var RelationType = document.getElementById("RelationType3");
                if (RelationType.checked) {
                    var CustomerRelation = document.getElementById("CustomerRelation");
                    if (CustomerRelation.value.trim() == '') {
                        alert("가입자와의 관계를 입력하세요.");
                        CustomerRelation.focus();
                        bResultAlert = false;
                    }   
                }
            }

            if (bResultAlert) {
                if (RetInfo == "") {
                    alert("법정 대리인의 본인인증을 해주세요.");
                    $("cbAgrJoin").focus();
                    bResultAlert = false;
                }
            }

            /*
            if (bResultAlert) {
                var agrParent = $("agrParent1");
                if (!agrParent.checked) {
                    alert('"법정 대리인이 회원가입에 동의하셔야 합니다.');
                    agrParent.focus();
                    bResultAlert = false;
                }
            }
            */

            //이름
            if ( bResultAlert ) {
                var CustomerName = document.getElementById( "CustomerName" );
                bResultAlert = InputDataCheck( CustomerName, DisplayAlert );
            }
            
            //아이디 - 체크 
            if ( bResultAlert ) {
                var CustId = document.getElementById( "CustId" );
                bResultAlert = InputDataCheck( CustId, DisplayAlert );
            }

            //이메일 - 체크 
            if ( bResultAlert ) {
                var email = document.getElementById( "Email" );
                bResultAlert = InputDataCheck( email, DisplayAlert );
            }

            //비밀번호1 - 체크 
            if ( bResultAlert ) {
                var password = document.getElementById( "password" );
                bResultAlert = InputDataCheck( password, DisplayAlert );
            }

            //비밀번호2 - 체크 
            if ( bResultAlert ) {
                var PasswordVerify = document.getElementById( "PasswordVerify" );
                bResultAlert = InputDataCheck( PasswordVerify, DisplayAlert );
            }

            //생년 - 체크 
            if ( bResultAlert ) {
                var BirthYear = document.getElementById( "BirthYear" );
                bResultAlert = InputDataCheck( BirthYear, DisplayAlert );
            }
            
            //생월 - 체크 
            if ( bResultAlert ) {
                var BirthMonth = document.getElementById( "BirthMonth" );
                bResultAlert = InputDataCheck( BirthMonth, DisplayAlert );
            }
            
            //생일 - 체크 
            if ( bResultAlert ) {
                var BirthYear = document.getElementById("BirthYear");
                var BirthMonth = document.getElementById("BirthMonth");
                var BirthDay = document.getElementById("BirthDay");
                bResultAlert = InputDataCheck(BirthDay, DisplayAlert);

                if (bResultAlert) {
                    if (parseInt(BirthDay.value) > parseInt(new Date(BirthYear.value, BirthMonth.value, 0).getDate())) {
                        alert('정확하게 입력해주세요.');
                        bResultAlert = false;
                        return false;
                    }
                }
            }
            
            ////성별 - 체크 
            //if ( bResultAlert ) {
            //    if ( !$( 'Sex1' ).checked && !$( 'Sex2' ).checked ) {
            //        alert( '성별을 선택하세요' );
            //        $( 'Sex1' ).focus();
            //        bResultAlert = false;
            //    }
            //}
            
            //휴대전화번호
            if ( bResultAlert ) {
                var hp1 = document.getElementById( "hp1" );
                bResultAlert = InputDataCheck( hp1, DisplayAlert );
            }
            
            //생년월일체크
            //if (bResultAlert)
            //{
            //    var BirthYear=2008; //날짜 유효성 체크를 위해 윤년인 2008년을 임의로 설정(2월 29일 허용)
            //    var BirthMonth=document.getElementById("BirthMonth");
            //    var BirthDay=document.getElementById("BirthDay");

            //    if (BirthMonth.value >0 ||  BirthDay.value >0)
            //    {
            //        if (!chkDate(BirthYear,BirthMonth.value,BirthDay.value))
            //        {
            //            alert('생일이 유효하지 않습니다. 생일을 다시 한번 확인해주세요~');
            //            bResultAlert=false;
            //            return false;
            //        }
            //    }
            //}
        }
        else if (CustomerType=='4')
        {
             //도서관 사서  옵션 추가 
             if (bResultAlert) {
                if ($j("input[name='chkLibrarian'][type='checkbox']").is(':checked')) {
                    $j("#JoinForm").find("input[name='Librarian']").val(1);
                    if ($j("#JoinForm").find("input[name='BusinessNo']").val().length == 0)
                    {
                        alert('도서관 사서 서비스에 신청하시려면 사업자 등록번호를 입력해주세요.');
                        $('BusinessNo').focus();
                        bResultAlert = false;
                        return false;
                    }
                } else {
                    $j("#JoinForm").find("input[name='Librarian']").val(0);
                }
            }

            //법인/단체명
            if ( bResultAlert ) {
                var BusinessName = document.getElementById( "BusinessName" );
                bResultAlert = InputDataCheck( BusinessName, DisplayAlert );
            }
            
            //구분
            if ( bResultAlert ) {
                if ( !$( 'SubCustomerType1' ).checked && !$( 'SubCustomerType2' ).checked && !$( 'SubCustomerType3' ).checked ) {
                    alert( '구분을 선택하세요' );
                    $( 'SubCustomerType1' ).focus();
                    bResultAlert = false;
                }
            }
            
            //이름
            if ( bResultAlert ) {
                var CustomerName = document.getElementById( "CustomerName" );
                bResultAlert = InputDataCheck( CustomerName, DisplayAlert );
            }
            
            //아이디

            if ( bResultAlert ) {
                var CustId = document.getElementById( "CustId" );
                bResultAlert = InputDataCheck( CustId, DisplayAlert );
            }
            
            //이메일

            if ( bResultAlert ) {
                var email = document.getElementById( "Email" );
                bResultAlert = InputDataCheck( email, DisplayAlert );
            }
            
            //비밀번호1
            if ( bResultAlert ) {
                var password = document.getElementById( "password" );
                bResultAlert = InputDataCheck( password, DisplayAlert );
            }

            //비밀번호2
            if ( bResultAlert ) {
                var PasswordVerify = document.getElementById( "PasswordVerify" );
                bResultAlert = InputDataCheck( PasswordVerify, DisplayAlert );
            }
            
            //휴대전화번호
            if ( bResultAlert ) {
                var hp1 = document.getElementById( "hp1" );
                bResultAlert = InputDataCheck( hp1, DisplayAlert );
            }
        }
        
        if (bResultAlert && (USA.value != 'True')) {
            if ( bResultAlert ) {
                var agr = $( "agrAladin1" );
                if ( !agr.checked ) {
                    alert( '[필수] 알라딘 이용약관에 동의해 주세요.' );
                    agr.focus();
                    bResultAlert = false;
                }
            }
            
            if ( bResultAlert ) {
                var agrCommunity = $( "agrCommunity1" );
                if ( !agrCommunity.checked ) {
                    alert( '[필수] 커뮤니티 이용약관에 동의해 주세요.' );
                    agrCommunity.focus();
                    bResultAlert = false;
                }
            }
            
            if ( bResultAlert ) {
                var agrInfo = $( "agrInfo1" );
                if ( !agrInfo.checked ) {
                    alert( '[필수] 개인정보 수집 및 이용에 동의해 주세요.' );
                    agrInfo.focus();
                    bResultAlert = false;
                }
            }
            if (bResultAlert) {
                var agrInfoChoice = $("agrInfoChoice");
                if (agrInfoChoice.checked) {
                    if (!$("Event").checked && !$("NewsSMS").checked && !$("AppPushOnEvent").checked) {
                        alert('[선택] 홍보 마케팅 목적 개인정보 수집 이용에 동의하신 경우, 정보를 수신 받을 채널을 1개 이상 선택해 주세요.');
                        agrInfoChoice.focus();
                        bResultAlert = false;
                    }
                }
            }

            /*
            if ( bResultAlert ) {
                var agrInfoOut = $( "agrInfoOut1" );
                if ( !agrInfoOut.checked ) {
                    alert( '본인 인증, 주문시 결제 및 배송 등 기본적인 알라딘 서비스를 이용하기 위해서 “개인정보 취급 위탁”에 동의해주셔야 합니다.' );
                    agrInfoOut.focus();
                    bResultAlert = false;
                }
            }
            if ( bResultAlert ) {
                var agrInfoThird = $( "agrInfoThird1" );
                if ( !agrInfoThird.checked ) {
                    alert( '제휴사를 통한 포인트 사용 및 적립, 추가 할인 서비스를 받기 위해서는 “개인정보 제3자 제공”에 동의해주셔야 합니다.\n이 약관에 동의하지 않고 주문하시려면 로그인 화면에서 “비회원 주문하기” 버튼을 눌러 주문할 수 있습니다.' );
                    agrInfoThird.focus();
                    bResultAlert = false;
                }
            }
            */
        }
        

        if ( bResultAlert ) {
            var f = $j("#JoinForm");
            f.find( "input[name='Action']" ).val( 1 );
            f.find( "#btn-submit" ).hide();
            f.find( "#process-img" ).show();
            f.submit();
        }    

        bResultAlert=false;
    }

    function InputDataCheck(o,DisplayAlert)
    {
        if (o.id=="CustId")
        {
            if (o.value.trim()==''){InputDataCheckResult(o,DisplayAlert,'아이디는 글자수는 4자~12자 이어야 합니다.');return false;}
            else
            {
                if ( o.value.trim().length < 4 || o.value.trim().length > 12 ) {
                    InputDataCheckResult( o, DisplayAlert, '아이디는 글자수는 4자~12자 이어야 합니다.' );
                    return false;
                }

                InputDataCheck_Ajax( o );

                if ( $( 'CustIdErrCheck' ).value != '1' ) {
                    InputDataCheckResult( o, DisplayAlert, '아이디를 다시 확인해 주세요' );
                    return false;
                }
            }
        }
        else if ( o.id == "Email" ) {

            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '알라딘에서는 이메일 주소로 로그인 하실 수 있습니다. 자주 사용하시는 메일 주소를 입력해주세요.' );
                return false;
            }

            var accountEmail = o.value;
            if ( $j( "#EmailDomain" ).val() != "0" && $j( "#EmailDomain" ).val() != "1" ){
                accountEmail = accountEmail + "@" + $j( "#EmailDomain" ).val();
            }
            else {
                accountEmail = accountEmail + "@" + $j("#EmailDomainText").val();
                
            }

            $j( "#accountemail" ).val( accountEmail );

            if ( accountEmail.mail() == '' ) {
                InputDataCheckResult( o, DisplayAlert, 'E-Mail주소를 정확히 입력해주세요' );
                return false;
            }

            InputDataCheck_Ajax( o );

            if ( $( 'EmailErrCheck' ).value != '1' ) {
                InputDataCheckResult( o, DisplayAlert, '이메일 주소를 정확하게 입력해주세요.' );
                return false;
            }
        }
        else if (o.id == "EmailDomain") {

            if (o.value.trim() == '') {
                InputDataCheckResult(o, DisplayAlert, '알라딘에서는 이메일 주소로 로그인 하실 수 있습니다. 자주 사용하시는 메일 주소를 입력해주세요.');
                return false;
            }

            var accountEmail = $j("#Email").val();
            if (o.value != "0" && o.value != "1") {
                accountEmail = accountEmail + "@" + o.value;
            }
            else {
                accountEmail = accountEmail + "@" + $j("#EmailDomainText").val();
            }

            $j("#accountemail").val(accountEmail);

            if (accountEmail.mail() == '') {
                InputDataCheckResult(o, DisplayAlert, 'E-Mail주소를 정확히 입력해주세요');
                return false;
            }

            InputDataCheck_Ajax(o);

            if ($('EmailErrCheck').value != '1') {
                InputDataCheckResult(o, DisplayAlert, '이메일 주소를 정확하게 입력해주세요.');
                return false;
            }
        }
        else if (o.id == "EmailDomainText") {

            if (o.value.trim() == '') {
                InputDataCheckResult(o, DisplayAlert, '알라딘에서는 이메일 주소로 로그인 하실 수 있습니다. 자주 사용하시는 메일 주소를 입력해주세요.');
                return false;
            }

            var accountEmail = $j("#Email").val();
            if ($j("#EmailDomain").val() != "0" && $j("#EmailDomain").val() != "1") {
                accountEmail = accountEmail + "@" + $j("#EmailDomain").val();
            }
            else {
                accountEmail = accountEmail + "@" + o.value;
            }
            
            $j("#accountemail").val(accountEmail);

            if (accountEmail.mail() == '') {
                InputDataCheckResult(o, DisplayAlert, 'E-Mail주소를 정확히 입력해주세요');
                return false;
            }

            InputDataCheck_Ajax(o);

            if ($('EmailErrCheck').value != '1') {
                InputDataCheckResult(o, DisplayAlert, '이메일 주소를 정확하게 입력해주세요.');
                return false;
            }
        }
        else if ( o.id == "accountemail" ) {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '알라딘에서는 이메일 주소로 로그인 하실 수 있습니다. 자주 사용하시는 메일 주소를 입력해주세요.' );
                return false;
            }
           // if ( o.value.mail() == '' ) { InputDataCheckResult( o, DisplayAlert, 'E-Mail주소를 정확히 입력해주세요' ); return false; }

            InputDataCheck_Ajax( o );
            if ( $( 'EmailErrCheck' ).value != '1' ) {
                InputDataCheckResult( o, DisplayAlert, '이메일 주소를 정확하게 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='CustomerNickName')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '커뮤니티 활동시 공개할 수 있는 별칭을 지어주세요' );
                return false;
            }

            InputDataCheck_Ajax(o);
        }
        else if (o.id=='password')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '비밀번호를 입력해주세요.' );
                return false;
            }

            if ( o.value.trim().length < 10 ) {
                InputDataCheckResult(o, DisplayAlert, '비밀번호 안전성 : 취약<br>- 비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합하여 10자~20자로 설정해주세요.');
                return false;
            }

            InputDataCheck_Ajax(o);

            if ( $( 'PwdErrCheck' ).value != '1' ) {
                InputDataCheckResult( o, DisplayAlert, '패스워드를 정확하게 입력해주세요.' );
                return false;
            }
            // if (!o.value.engnum()){InputDataCheckResult(o,DisplayAlert,'비밀번호는 영문자, 숫자로만 입력해주세요. ');return false;}
            // if(!CheckPasswordValidChar(o.value.trim())){ InputDataCheckResult(o,DisplayAlert,"영문 대소문자, 숫자, 특수문자 중 2가지 이상을 조합한 10자 이상의 조합을 권장합니다.");return false; }
        }
        else if (o.id=='PasswordVerify')
        {
            var pass=document.getElementById("password");
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '위에서 입력한 비밀번호를 다시 한번 입력해주세요.' );
                return false;
            }

            if ( o.value.trim() != pass.value.trim() && pass.value.trim() != '' ) {
                InputDataCheckResult( o, DisplayAlert, '위에서 입력한 비밀번호와 동일하게 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='Zip')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '주소를 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='Address2')
        {
            //if (o.value.trim()==''){InputDataCheckResult(o,DisplayAlert,'나머지 주소를 입력해주세요.');return false;}
            if ( o.value.length >= 100 ) {
                InputDataCheckResult( o, DisplayAlert, 'Address Line2은 100자 이내로 입력해주세요' );
                return false;
            }
        }
        else if (o.id=='hp1' || o.id=='hp2' || o.id=='hp3')
        {
            var hp1=document.getElementById("hp1");
            var hp2=document.getElementById("hp2");
            var hp3=document.getElementById("hp3");
            var mobile=hp1.value + hp2.value + hp3.value;
            var mobileadd=hp1.value + '-' + hp2.value + '-' + hp3.value;
            
            if ( mobile == '' ) {
                InputDataCheckResult( o, DisplayAlert, '휴대전화번호를  입력해주세요. <br> 주문 발송 단계별로 문자 안내를 보내드립니다.' );
                return false;
            }
            //USA 는 자리수 체크만

            var USA= $("USA").value;
            var CustomerType=$("CustomerType").value;
            
            if (!(USA =='True' || CustomerType=='2')) {
                if ( !mobileadd.mobile2() ) {
                    InputDataCheckResult( o, DisplayAlert, '휴대전화번호를 정확하게 입력해주세요.' );
                    return false;
                }
            }
        }
        else if (o.id=='tel1' || o.id=='tel2' || o.id=='tel3')
        {
            var tel1=document.getElementById("tel1");
            var tel2=document.getElementById("tel2");
            var tel3=document.getElementById("tel3");
            var tel=tel1.value + tel2.value +  tel3.value;
            
            if ( tel.trim() == '' && DisplayAlert != '1' ) {
                InputDataCheckResult( o, '0', '지역번호를 포함하여 유선전화번호를 입력해주세요.' );
                return true;
            }

            if (tel.trim()!='')
            {
                var teladd=tel1.value + '-' + tel2.value + '-' +  tel3.value;

                if ( !teladd.phone2() ) {
                    InputDataCheckResult( o, DisplayAlert, '유선전화번호를 정확하게 입력해주세요.' );
                    return false;
                }
            }
        }
        else if (o.id=='ParentEmailAddr')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '부모님 (법정대리인)의 이메일 주소를 입력해주세요. <br>입력하신 이메일 주소로 알라딘 가입 동의서가 발송됩니다.' );
                return false;
            }
            if ( o.value.mail() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '이메일 주소를 정확하게 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='CustomerName')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '이름을 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='BusinessName')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, '법인/단체명을 입력해주세요. ' );
                return false;
            }
        }        
        else if (o.id=='BusinessNo')
        {
            if ( o.value.trim() == '' && DisplayAlert != '1' ) {
                InputDataCheckResult( o, '0', '사업자 등록번호를 입력해주세요. <br>단, 사업자 등록번호가 없는 단체인 경우 생략하셔도 됩니다.' );
                return true;
            }

            if (o.value.trim()!='')
            {
                if ( o.value.trim().length != 12 ) {
                    InputDataCheckResult( o, DisplayAlert, '"-"를 포함하여 정확하게 입력해주세요. (예 : 201-81-23094)' );
                    return false;
                }

                if ( !o.value.biznum2() ) {
                    InputDataCheckResult( o, DisplayAlert, '"-"를 포함하여 정확하게 입력해주세요. (예 : 201-81-23094)' );
                    return false;
                }
            }
        }
        else if (o.id=='Address1_F')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, 'Address Line1을 입력해주세요' );
                return false;
            }

            if ( o.value.trim().length < 2 ) {
                InputDataCheckResult( o, DisplayAlert, 'Address Line1을 다시 확인해 주세요' );
                return false;
            }

            if ( o.value.length >= 50 ) {
                InputDataCheckResult( o, DisplayAlert, 'Address Line1은 50자 이내로 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='Address2_F')
        {
            //if (o.value.trim()==''  && DisplayAlert!='1'){InputDataCheckResult(o,'0','아파트 번호, 층수 등을 입력하며 없으면 생략');return false;}
            //if (o.value.trim()!='')
            //{
            //    if (o.value.trim().length<2){InputDataCheckResult(o,DisplayAlert,'아파트 번호, 층수 등을 입력하며 없으면 생략');return false;}
            //}
            if ( o.value.length >= 100 ) {
                InputDataCheckResult( o, DisplayAlert, 'Address Line2은 100자 이내로 입력해주세요.' );
                return false;
            }
        }
        else if (o.id=='City')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, 'City를 입력해주세요' );
                return false;
            }

            if ( o.value.trim().length < 2 ) {
                InputDataCheckResult( o, DisplayAlert, 'City를 다시 확인해 주세요' );
                return false;
            }
        }
        else if (o.id=='Zip_F')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, 'ZIP/Postal Code를 입력해주세요' );
                return false;
            }

            if ( o.value.trim().length < 2 ) {
                InputDataCheckResult( o, DisplayAlert, 'ZIP/Postal Code를 다시 확인해 주세요' );
                return false;
            }
        }
        else if (o.id=='hp')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult( o, DisplayAlert, 'Mobile을 입력해 주세요' );
                return false;
            }

            if ( o.value.trim().length < 2 ) {
                InputDataCheckResult( o, DisplayAlert, 'Mobile을 다시 확인해 주세요' );
                return false;
            }
        }
        else if (o.id=='tel')
        {
            if ( o.value.trim() == '' && DisplayAlert != '1' ) {
                InputDataCheckResult( o, '0', 'Home/Office을 입력해주세요 (선택사항입니다.)' );
                return true;
            }

            if (o.value.trim()!='')
            {
                if ( o.value.trim().length < 2 ) {
                    InputDataCheckResult( o, DisplayAlert, 'Home/Office을 다시 확인해 주세요' );
                    return false;
                }
            }
        }       
        else if (o.id=='State')
        {
            if ( o.value.trim() == '' && DisplayAlert != '1' ) {
                InputDataCheckResult( o, '0', 'USA,CANADA는 필수 입력사항입니다.' );
                return false;
            }

            if (o.value.trim()!='')
            {
                if ( o.value.trim().length < 2 ) {
                    InputDataCheckResult( o, DisplayAlert, 'USA,CANADA을 다시 확인해 주세요' );
                    return false;
                }
            }            
        }
        else if (o.id=='BirthYear')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult(o, DisplayAlert, '생년월일을 정확하게 입력해주세요.');
                return false;
            }

            var birthYear = parseInt(o.value);
            if ( isNaN( birthYear ) || birthYear <= 1900 ) {
                InputDataCheckResult(o, DisplayAlert, '생년월일을 정확하게 입력해주세요.');
                return false;
            }
        }
        else if (o.id=='BirthMonth')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult(o, DisplayAlert, '생년월일을 정확하게 입력해주세요.');
                return false;
            }

            var birthMonth = parseInt(o.value);
            if ( isNaN( birthMonth ) || birthMonth < 1 || birthMonth > 12 ) {
                InputDataCheckResult(o, DisplayAlert, '생년월일을 정확하게 입력해주세요.');
                return false;
            }
        }
        else if (o.id=='BirthDay')
        {
            if ( o.value.trim() == '' ) {
                InputDataCheckResult(o, DisplayAlert, '생년월일을 정확하게 입력해주세요.');
                return false;
            }

            var birthDay = parseInt(o.value);
            if(isNaN(birthDay) || birthDay<1 || birthDay>31){
                InputDataCheckResult(o, DisplayAlert, '생년월일을 정확하게 입력해주세요.');
                return false;
            }
        }
        else if (o.id == 'CustomerRelation') {
            if (o.value.trim() == '') {
                InputDataCheckResult(o, DisplayAlert, '가입자와의 관계를 입력해주세요.');
                return false;
            }
        }

        //에러가 없는 경우 풍선도움말 숨김/메시지 공통
        DisplayHide(get_id(o) + '_helplayer');

        return true;
    }
    
    function get_id(o)
    {
        if (o.id=='hp1' || o.id=='hp2' || o.id=='hp3')
        {
            return 'hp';
        }

        if (o.id=='tel1' || o.id=='tel2' || o.id=='tel3')
        {
            return 'tel';
        }
        
        if (o.id == 'Email' || o.id == 'EmailDomain' || o.id == 'EmailDomainText') {
            return 'Email';
        }

        return o.id;
    }
    
    function CountryReplace(o)
    {
        var objhidden=$('dvStatus_' + o.value);
        var objshow=$('State');
        objshow.outerHTML = objshow.outerHTML.replace( objshow.innerHTML + '</select>' , objhidden.innerHTML  + '</select>' );
    }

    function CheckPasswordValidChar(pwd){
        if(!pwd || pwd.length<=0){
            return false;
        }
        
	    var validCharGroupCount = 0;
	    var charGroup = [
		    'abcdefghijklmnopqrstuvwxyz',
		    'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
		    '!@#$%^&*()`~-_=+[{]}\\|;:\'",<.>/?',
		    '1234567890'];

	    for(var i=0; i<charGroup.length; i++){
		    var isFound = SearchPasswordValidCharGroup(pwd, charGroup[i]);
		    if(isFound) { 
			    validCharGroupCount++;
		    };
	    }

        /*
	    if (validCharGroupCount == 2 && pwd.length >= 10) {
		    return true;
	    }

	    if (validCharGroupCount >= 3 && pwd.length >= 8) {
		    return true;
	    }
	    */
	    if (validCharGroupCount >= 2 && pwd.length >= 10) {
		    return true;
	    }

	    return false;
    }

    function SearchPasswordValidCharGroup(pwd, groupCase) {
	    if(!pwd || !groupCase || pwd.length<=0 || groupCase.length<=0) {
		    return false;
	    }

	    for(var i=0; i<groupCase.length; i++) {
		    if(pwd.indexOf(groupCase.charAt(i)) > -1) {
			    return true;
		    }
	    }
	    return false;
    }    
    
    
    function NewsLetterCheck(checked)
    {
        $('NewsLetter').checked=checked;
        //$('Gift').checked=checked;
        $('Beauty').checked=checked;
        $('Business').checked=checked;
        $('Literature').checked=checked;
        $('Kid').checked=checked;
        $('Social').checked=checked;
        $('Comic').checked=checked;
        $('Foreign').checked=checked;
        $('ForeignJapan').checked=checked;
        $('ForeignKids').checked=checked;
        $('Music').checked=checked;
        $('DVD').checked=checked;
        $('DVD').checked=checked;
        $('DVD').checked=checked;
        $('ebook').checked=checked;
        $('library').checked=checked;
    }
