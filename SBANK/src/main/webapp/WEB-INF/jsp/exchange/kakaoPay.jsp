<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="id" value="${exchangeVO.id }" />
<c:set var="currencycode" value="${exchangeVO.currencycode}" />
<c:set var="exchangeprice" value="${exchangeVO.exchangeprice}" />
<c:set var="exchangerate" value="${exchangeVO.exchangerate}" />
<c:set var="exchangecharge" value="${exchangeVO.exchangecharge}" />
<c:set var="name" value="${exchangeVO.name}" />
<c:set var="exchange_date" value="${exchangeVO.exchange_date}" />
<c:set var="exchange_place" value="${exchangeVO.exchange_place}" />
<c:set var="account_num" value="${exchangeVO.account_num}" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp44552637'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        //alert('아이디')
        
        let amountprice  = ${exchangecharge};

        //alert(typeof(amountprice))

        

        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : '${account_num}',
            name : 'SBANK 환전',
            amount : 1*${exchangecharge},
            buyer_name : '${name}',
            buyer_tel : '010-9438-5248'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                
                //alert('ajax 하즈아~')
                
                
                
                $.ajax({
                  url : '${ pageContext.request.contextPath }/exchange/kakaoPayInsert',
                  type : 'post',
                  data : {
                    id : '${id}',
                    currencycode : '${currencycode}',
                    exchangeprice : '${exchangeprice}',
                    exchangerate : '${exchangerate}',
                    exchangecharge : '${exchangecharge}',
                    name : '${name}',
                    exchange_date : '${exchange_date}',
                    exchange_place : '${exchange_place}',
                    account_num : '${account_num}'
                  }, 
                  success : function() {
                    
                    //alert('성공 ajax - after insert ')
                  }, 
                  error : function() {
                    alert(' ajax실패 - not insert')
                  }, complete : function() {
                    //여기서 뭘할까아
                  }
                })
                
                
                
                
                
                
                //성공시 이동할 페이지
                <%-- location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
                location.href='/SBANK/exchange/myExchangeKakao';
                
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/";
                alert(msg);
            }
        });
        
    });
    </script>
 
</body>
</html>
    