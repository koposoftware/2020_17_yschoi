<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">



  function getTimeStamp() {

    var d = new Date();
    var s = leadingZeros(d.getFullYear(), 4) + leadingZeros(d.getMonth() + 1, 2) + leadingZeros(d.getDate(), 2);

    return s;
  }
  

  function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
      for (i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
  }
  

  $(document).ready(function() {
    //통화 코드 바꿀때마다 그래프 보여주기!
    
    var today = getTimeStamp();
    //alert(today);
    
    var firstsrc ='https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month3/FX_USDKRW.png?sidcode=';
    firstsrc += today;
    $("#style-img").attr("src", firstsrc);

    $("#currencycode").change(function() {
      var cur_value = $('option:selected', this).text();
      cur_value = cur_value.slice(-4, -1);
      console.log(cur_value);

      var src = 'https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month3/FX_'
      src += cur_value;
      src += 'KRW.png?sidcode=';
      src +=today;

      //console.log(image_src);
      $("#style-img").attr("src", src);
    });

  });

  
  
  
  
  
  
  $(document).ready(function() {

    $.ajax({ //페이지 로드 시 로그인한 사람의 계좌 확인하기
    url : '${ pageContext.request.contextPath }/exchange/getAccount_num',
    type : 'get',
    success : function(data) {
      let list = JSON.parse(data);
      console.log(list)

      $(list).each(function() {

        let str = '';

        str += '<option class="acc" name='+this.bank_name+' value='+this.account_num+' id='+this.balance+'>' + '[계좌번호 : ' + this.account_num + ', 잔액:' + this.balance + '원]</option>';

        $('#account_num').append(str);
      })

    },
    error : function() {
      alert('실패')
    },
    complete : function() {
      /* 뭘해줘야할까 */
    }
    })
    
  });
  

  $(document).ready(function() {
    $('#currencycode').change(function() { //통화를 선택하면에 대한 function 시작
      let currency = $(this).val(); // 통화코드추출
      //alert(currency)
      $('#commission').val('');
      $('#basicrate').val('');

      
      $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/getRateCommission/' + currency,
      type : 'get',
      success : function(data) {
        let list = JSON.parse(data);
        console.log(list)

        let rate = list.cashbuyrate;
        let commission2 = list.commission2;
        let basicrate = list.basicrate
        let commission = list.commission
        let commrate = ((rate - basicrate) * commission) + basicrate

        let ori = '현찰 살때 가격';
        let str = ori + rate
        document.getElementById('rateHidden').value += str;
        document.getElementById('rateHidden').value += str;
        document.getElementById('basicrate').value += basicrate;
        document.getElementById('commission').value += commission;
        /* $("#commrate").text(commrate.toFixed(2)); */
        $("#commission2").text(commission2);
        $("#rate").text((list.cashbuyrate).toFixed(2));

        rate = "";
        //여기부터어추가아아아
        commission2 = "";
        basicrate="";
        commission="";
        commrate="";
        ori="";
        str="";
        
        

      },
      error : function() {
        alert('실패')
      },
      complete : function() {
        $('#exchangeprice').val(''); //input type text
        $('#reserverate').val(''); //input type text
        $('#exchangeChargeKRW').text('') //span
        $('#commrate').text('') //span
        $('#exchangecharge').val(''); //input type hidden
        $('#exchangerate').val(''); //input type hidden
         //input type hidden
      }
      })
    }) //통화를 선택하면에 대한 function 끝.
  });
  
  
  
    
  
$(document).ready(function() {
  
  
  var list='';
  
  
  
  $(document).on("keyup","#user_code",function(){  // 구글 OTP인증코드 적으면 함수
    var ipt = $(this).val()
    console.log(ipt);
    var keyofgoogle = 'a';
    
    if(ipt.length == 6){
      console.log('6');
      console.log(keyofgoogle);
      
      $.ajax({
        url : '${ pageContext.request.contextPath }/otp/chk',
        type : 'post',
        data : {
          encodedKey : keyofgoogle,
          user_code : ipt
        },
        async:false,
        success : function(data) {
          result = JSON.parse(data);
          console.log(result);
          
          if(result=='true'){
            $("#setresult").text('');
            $("#setresult").text('아래 확인 버튼을 눌러 환전예약을 진행하여주세요.');
            $("#setresult").css("fontSize","16px");
            $("input[type=submit]").prop('disabled',false);
          } else{
            $("#setresult").text('');
            $("#setresult").text('인증코드를 확인하여주세요');
            $("#setresult").css("fontSize","16px");
          }

          return false;
        }, 
        error : function() {
          alert('실패')
        }
      });
    }
    
  });// 구글 OTP인증코드 적으면 함수 끝
  
  
  
    $(document).on('click', '#subm', function() {
      //alert('!')
      //let bal = $(this).attr('id');
      //console.log(bal);

      let realid = $("#account_num option:selected").attr('id'); // 선택한 계좌의 잔액임
      realid = 1 * realid
      console.log(typeof (realid));
      console.log(realid);

      var chargeKRW = $('#exchangecharge').val(); //환전시 필요한 잔액
      chargeKRW = 1 * chargeKRW
      console.log(typeof (chargeKRW));
      console.log(chargeKRW);

      if (!(realid >= chargeKRW)) {
        $(".modal-title").append("환전예약하기");
        $(".modal-body").append('선택하신 계좌의 잔액을 확인해주세요. 잔액이 부족합니다.');
        $("#exampleModal").modal("show");
        $(".modal-body").css("fontSize","16px");
        $(".modal-title").css("fontSize","16px");
        return false;

      }

      var bank_name = $('#bank_name').val(); // 사용자가 써준 해싱전의 pwd
      /* alert(bank_name); */
      var realpwd = $("input[type=hidden][name=pwd]").val() // db에 저장되어있는 해싱후의 진짜 pwd

      var afterHashIpt = '';

      $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/returnHash/' + bank_name,
      type : 'get',
      async : false,
      success : function(data) {
        var list = JSON.parse(data);
        afterHashIpt = list;
        afterHashIpt2 = data;
        /* alert(typeof(list)) */
      },
      error : function() {
        alert('실패')

        return false;
      },
      complete : function() {
      }
      });

      /* alert('afterHashIpt : ' + afterHashIpt);
      alert('realpwd : ' + realpwd); */

      if (afterHashIpt == realpwd) {
        
        var strr='<span id="aaa">';
        
        
        /*$.ajax({
          url : '${ pageContext.request.contextPath }/otp/genn',
          type : 'get',
          async:false,
          success : function(data) {
            list = JSON.parse(data);
            console.log(list);
            return false;
          }, 
          error : function() {
            alert('실패')
          }
        });
        console.log(list[0]);
        console.log(list[1]);
        console.log(list[2]);*/
        
        
        
        strr+='환전예약을 원하시면 Google OTP로 본인인증을 진행하여주세요.<br><br>';
        /*strr+='인증키는 ';
        strr+=list[0];
        strr+='입니다.<br>';
        strr+='<a href="';
        strr+=list[1];
        strr+='" target="_blank"> QR코드확인하기 </a> 입니다.<br>';*/
        /* strr+='<img src="${pageContext.request.contextPath }/resources/upload/';
        strr+=list[2];
        strr+='"><br>'; */
        <%-- strr+='<form action="<%=request.getContextPath() %>/otp/chkk" method="post">'; --%>
        strr+='  OTP 번호를 입력하여주세요.';
        strr+='  code : </span> <input  name="user_code" id="user_code"  type="text" ">';
        strr+='  <input name="encodedKey" type="hidden" readonly="readonly" value="a"><br><br>';
        strr+='  <span id="setresult" name="setresult" ></span><br><br>';
        /* strr+='  <input type="submit" value="전송!">'; */
        /* strr+='</form>'; */
        
        
        $(".modal-title").append("환전예약하기");
        $(".modal-body").append(strr);
        /* $("input[type=submit]").prop('disabled', false); */
        let aa = $("#exampleModal").modal("show");
        $("#aaa").css("fontSize","16px");
        $(".modal-title").css("fontSize","16px");
        return false;
        if (aa) {
          return true;
        }
      } else {
        $(".modal-title").append("환전예약하기");
        $(".modal-body").append('선택하신 계좌의 비밀번호를 확인해주세요.');
        $("#exampleModal").modal("show");
        return false;
      }

    });
  });
  

  
  
  
  
  
  
  $(document).ready(function() {
    $('#account_num').change(function() {
      /* alert($("#account_num > option:selected").attr('name'));  */
      let realpwd = $("#account_num > option:selected").attr('name'); // 선택된 옵션의 name의 값을 가져오기
      $("input[type=hidden][name=pwd]").val(realpwd); // hidden에 방금 선택한 계좌의 비밀번호 값 저장
      /* alert($("input[type=hidden][name=pwd]").val()); //hidden에 있는 값 확인하기 */

    });

  })

  
  
  
  function keyevent() {

    let exchangeCharge = document.getElementById("exchangeprice").value; //환전금액(외화)
    let reserverate = document.getElementById("reserverate").value; //목표환율
    let basicrate = document.getElementById("basicrate").value; //매매기준율
    let comm = document.getElementById("commission").value; //수수료1

    /*     alert(exchangeCharge)
     alert(reserverate)
     alert(basicrate) 
     alert(comm) */

    if (exchangeCharge == '' || reserverate == '') {
      return false
    }
    console.log('----------------------')
    console.log(exchangeCharge)
    console.log(reserverate)
    console.log(basicrate)
    console.log(comm)
    //alert('after return')

    let re1 = (reserverate - basicrate).toFixed(2)

    let re2 = (re1 * comm).toFixed(2)
    re2 = 1 * re2
    basicrate = 1 * basicrate

    let re3 = (re2 + basicrate).toFixed(2) // re3 = 우대환율

    exchangeChargeKRW = exchangeCharge * commrate
    exchangeChargeKRW = exchangeChargeKRW.toFixed(2)

    document.getElementById("exchangeChargeKRW").innerHTML = ((re3 * exchangeCharge).toFixed(2)); //환전금액(원) 값 띄어주기
    document.getElementById("commrate").innerHTML = re3; //우대환율(원) 값 띄어주기

    document.getElementById('exchangecharge').value = ((re3 * exchangeCharge).toFixed(2)); // hidden필드에 값 넣어주기 환전금액(원)
    document.getElementById('exchangerate').value = re3; // hidden필드에 값 넣어주기 우대환율(원)

    exchangeChargeKRW = "";
    commrate = "";
    re1 = "";
    re2 = "";
    basicrate = "";
    re3 = "";

  }

  $(document).ready(function() {
    $("#modal_show").click(function() {
      $("#exampleModal").modal("show");
    });

    $("#close_submit").click(function() {
      $("#exampleModal").modal("hide");
      $(".modal-title").empty();
      $(".modal-body").empty();
    });
    $("#close_cancel").click(function() {
      $("#exampleModal").modal("hide");
      $(".modal-title").empty();
      $(".modal-body").empty();
    });
  });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  //////////////////////프로세스
  $(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
    
(function ($) {
    var MAIN_TEMPLATE_1 = '{preview}\n' +
        '<div class="input-group {class}">\n' +
        '   {caption}\n' +
        '   <div class="input-group-btn">\n' +
        '       {remove}\n' +
        '       {upload}\n' +
        '       {browse}\n' +
        '   </div>\n' +
        '</div>';

    var MAIN_TEMPLATE_2 = '{preview}\n{remove}\n{upload}\n{browse}\n';

    var PREVIEW_TEMPLATE = '<div class="file-preview {class}">\n' +
        '   <div class="file-preview-status text-center text-success"></div>\n' +
        '   <div class="close fileinput-remove text-right">×</div>\n' +
        '   <div class="file-preview-thumbnails"></div>\n' +
        '   <div class="clearfix"></div>' +
        '</div>';

    var CAPTION_TEMPLATE = '<div class="form-control file-caption {class}">\n' +
        '   <span class="glyphicon glyphicon-file"></span> <span class="file-caption-name"></span>\n' +
        '</div>';

    var MODAL_TEMPLATE = '<div id="{id}" class="modal fade">\n' +
        '  <div class="modal-dialog modal-lg">\n' +
        '    <div class="modal-content">\n' +
        '      <div class="modal-header">\n' +
        '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>\n' +
        '        <h3 class="modal-title">Detailed Preview <small>{title}</small></h3>\n' +
        '      </div>\n' +
        '      <div class="modal-body">\n' +
        '        <textarea class="form-control" style="font-family:Monaco,Consolas,monospace; height: {height}px;" readonly>{body}</textarea>\n' +
        '      </div>\n' +
        '    </div>\n' +
        '  </div>\n' +
        '</div>\n';

    var isEmpty = function (value, trim) {
        return value === null || value === undefined || value == []
            || value === '' || trim && $.trim(value) === '';
    };
    var getValue = function (options, param, value) {
        return (isEmpty(options) || isEmpty(options[param])) ? value : options[param];
    };
    var isImageFile = function (type, name) {
        return (typeof type !== "undefined") ? type.match('image.*') : name.match(/\.(gif|png|jpe?g)$/i);
    };
    var isTextFile = function (type, name) {
        return (typeof type !== "undefined") ? type.match('text.*') : name.match(/\.(txt|md|csv|htm|html|php|ini)$/i);
    };
    var uniqId = function () {
        return Math.round(new Date().getTime() + (Math.random() * 100));
    };
    var FileInput = function (element, options) {
        this.$element = $(element);
        this.showCaption = options.showCaption;
        this.showPreview = options.showPreview;
        this.showRemove = options.showRemove;
        this.showUpload = options.showUpload;
        this.captionClass = options.captionClass;
        this.previewClass = options.previewClass;
        this.mainClass = options.mainClass;
        if (isEmpty(options.mainTemplate)) {
            this.mainTemplate = this.showCaption ? MAIN_TEMPLATE_1 : MAIN_TEMPLATE_2;
        }
        else {
            this.mainTemplate = options.mainTemplate;
        }
        this.previewTemplate = (this.showPreview) ? options.previewTemplate : '';        
        this.captionTemplate = options.captionTemplate;
        this.browseLabel = options.browseLabel;
        this.browseIcon = options.browseIcon;
        this.browseClass = options.browseClass;
        this.removeLabel = options.removeLabel;
        this.removeIcon = options.removeIcon;
        this.removeClass = options.removeClass;
        this.uploadLabel = options.uploadLabel;
        this.uploadIcon = options.uploadIcon;
        this.uploadClass = options.uploadClass;
        this.uploadUrl = options.uploadUrl;
        this.msgLoading = options.msgLoading;
        this.msgProgress = options.msgProgress;
        this.msgSelected = options.msgSelected;
        this.previewFileType = options.previewFileType;
        this.wrapTextLength = options.wrapTextLength;
        this.wrapIndicator = options.wrapIndicator;
        this.isDisabled = this.$element.attr('disabled') || this.$element.attr('readonly');
        if (isEmpty(this.$element.attr('id'))) {
            this.$element.attr('id', uniqId());
        }
        this.$container = this.createContainer();
        /* Initialize plugin option parameters */
        this.$captionContainer = getValue(options, 'elCaptionContainer', this.$container.find('.file-caption'));
        this.$caption = getValue(options, 'elCaptionText', this.$container.find('.file-caption-name'));
        this.$previewContainer = getValue(options, 'elPreviewContainer', this.$container.find('.file-preview'));
        this.$preview = getValue(options, 'elPreviewImage', this.$container.find('.file-preview-thumbnails'));
        this.$previewStatus = getValue(options, 'elPreviewStatus', this.$container.find('.file-preview-status'));
        this.$name = this.$element.attr('name') || options.name;
        this.$hidden = this.$container.find('input[type=hidden][name="' + this.$name + '"]');
        if (this.$hidden.length === 0) {
            this.$hidden = $('<input type="hidden" />');
            this.$container.prepend(this.$hidden);
        }
        this.original = {
            preview: this.$preview.html(),
            hiddenVal: this.$hidden.val()
        };
        this.listen()
    };

    FileInput.prototype = {
        constructor: FileInput,
        listen: function () {
            var self = this;
            self.$element.on('change', $.proxy(self.change, self));
            $(self.$element[0].form).on('reset', $.proxy(self.reset, self));
            self.$container.find('.fileinput-remove').on('click', $.proxy(self.clear, self));
        },
        trigger: function (e) {
            var self = this;
            self.$element.trigger('click');
            e.preventDefault();
        },
        clear: function (e) {
            var self = this;
            if (e) {
                e.preventDefault();
            }

            self.$hidden.val('');
            self.$hidden.attr('name', self.name);
            self.$element.attr('name', '');
            self.$element.val('');
            if (e !== false) {
                self.$element.trigger('change');
                self.$element.trigger('fileclear');
            }
            self.$preview.html('');
            self.$caption.html('');
            self.$container.removeClass('file-input-new').addClass('file-input-new');
        },
        reset: function (e) {
            var self = this;
            self.clear(false);
            self.$hidden.val(self.original.hiddenVal);
            self.$preview.html(self.original.preview);
            self.$container.find('.fileinput-filename').text('');
            self.$element.trigger('filereset');
        },
        change: function (e) {
            var self = this;
            var elem = self.$element, files = elem.get(0).files, numFiles = files ? files.length : 1,
                label = elem.val().replace(/\\/g, '/').replace(/.*\//, ''), preview = self.$preview,
                container = self.$previewContainer, status = self.$previewStatus, msgLoading = self.msgLoading,
                msgProgress = self.msgProgress, msgSelected = self.msgSelected, tfiles,
                fileType = self.previewFileType, wrapLen = parseInt(self.wrapTextLength),
                wrapInd = self.wrapIndicator;

            if (e.target.files === undefined) {
                tfiles = e.target && e.target.value ? [
                    {name: e.target.value.replace(/^.+\\/, '')}
                ] : [];
            }
            else {
                tfiles = e.target.files;
            }
            if (tfiles.length === 0) {
                return;
            }
            preview.html('');
            var total = tfiles.length, self = self;
            for (var i = 0; i < total; i++) {
                (function (file) {
                    var caption = file.name;
                    var isImg = isImageFile(file.type, file.name);
                    var isTxt = isTextFile(file.type, file.name);
                    if (preview.length > 0 && (fileType == "any" ? (isImg || isTxt) : (fileType == "text" ? isTxt : isImg)) && typeof FileReader !== "undefined") {
                        var reader = new FileReader();
                        status.html(msgLoading);
                        container.addClass('loading');
                        reader.onload = function (theFile) {
                            var content = '', modal = "";
                            if (isTxt) {
                                var strText = theFile.target.result;
                                if (strText.length > wrapLen) {
                                    var id = uniqId(), height = window.innerHeight * .75,
                                        modal = MODAL_TEMPLATE.replace("{id}", id).replace("{title}", caption).replace("{body}", strText).replace("{height}", height);
                                    wrapInd = wrapInd.replace("{title}", caption).replace("{dialog}", "$('#" + id + "').modal('show')");
                                    strText = strText.substring(0, (wrapLen - 1)) + wrapInd;
                                }
                                content = '<div class="file-preview-frame"><div class="file-preview-text" title="' + caption + '">' + strText + '</div></div>' + modal;
                            }
                            else {
                                content = '<div class="file-preview-frame"><img src="' + theFile.target.result + '" class="file-preview-image" title="' + caption + '" alt="' + caption + '"></div>';
                            }
                            preview.append("\n" + content);
                            if (i >= total - 1) {
                                container.removeClass('loading');
                                status.html('');
                            }
                        };
                        reader.onprogress = function (data) {
                            if (data.lengthComputable) {
                                var progress = parseInt(((data.loaded / data.total) * 100), 10);
                                var msg = msgProgress.replace('{percent}', progress).replace('{file}', file.name);
                                status.html(msg);
                            }
                        };
                        if (isTxt) {
                            reader.readAsText(file);
                        }
                        else {
                            reader.readAsDataURL(file);
                        }
                    }
                    else {
                        preview.append("\n" + '<div class="file-preview-frame"><div class="file-preview-other"><h2><i class="glyphicon glyphicon-file"></i></h2>' + caption + '</div></div>');
                    }
                })(tfiles[i]);
            }
            var log = numFiles > 1 ? msgSelected.replace('{n}', numFiles) : label;
            self.$caption.html(log);
            self.$container.removeClass('file-input-new');
            elem.trigger('fileselect', [numFiles, label]);
        },
        createContainer: function () {
            var self = this;
            var container = $(document.createElement("div")).attr({"class": 'file-input file-input-new'}).html(self.renderMain());
            self.$element.before(container);
            container.find('.btn-file').append(self.$element);
            return container;
        },
        renderMain: function () {
            var self = this;
            var preview = self.previewTemplate.replace('{class}', self.previewClass);
            var css = self.isDisabled ? self.captionClass + ' file-caption-disabled' : self.captionClass;
            var caption = self.captionTemplate.replace('{class}', css);
            return self.mainTemplate.replace('{class}', self.mainClass).
                replace('{preview}', preview).
                replace('{caption}', caption).
                replace('{upload}', self.renderUpload()).
                replace('{remove}', self.renderRemove()).
                replace('{browse}', self.renderBrowse());
        },
        renderBrowse: function () {
            var self = this, css = self.browseClass + ' btn-file', status = '';
            if (self.isDisabled) {
                status = ' disabled ';
            }
            return '<div class="' + css + '"' + status + '> ' + self.browseIcon + self.browseLabel + ' </div>';
        },
        renderRemove: function () {
            var self = this, css = self.removeClass + ' fileinput-remove fileinput-remove-button', status = '';
            if (!self.showRemove) {
                return '';
            }
            if (self.isDisabled) {
                status = ' disabled ';
            }
            return '<button type="button" class="' + css + '"' + status + '>' + self.removeIcon + self.removeLabel + '</button>';
        },
        renderUpload: function () {
            var self = this, content = '', status = '';
            if (!self.showUpload) {
                return '';
            }
            if (self.isDisabled) {
                status = ' disabled ';
            }
            if (isEmpty(self.uploadUrl)) {
                content = '<button type="submit" class="' + self.uploadClass + '"' + status + '>' + self.uploadIcon + self.uploadLabel + '</button>';
            }
            else {
                content = '<a href="' + self.uploadUrl + '" class="' + self.uploadClass + '"' + status + '>' + self.uploadIcon + self.uploadLabel + '</a>';
            }
            return content;
        },
    }

    $.fn.fileinput = function (options) {
        return this.each(function () {
            var $this = $(this), data = $this.data('fileinput')
            if (!data) {
                $this.data('fileinput', (data = new FileInput(this, options)))
            }
            if (typeof options == 'string') {
                data[options]()
            }
        })
    };

    //FileInput plugin definition
    $.fn.fileinput = function (option) {
        var args = Array.apply(null, arguments);
        args.shift();
        return this.each(function () {
            var $this = $(this),
                data = $this.data('fileinput'),
                options = typeof option === 'object' && option;

            if (!data) {
                $this.data('fileinput', (data = new FileInput(this, $.extend({}, $.fn.fileinput.defaults, options, $(this).data()))));
            }

            if (typeof option === 'string') {
                data[option].apply(data, args);
            }
        });
    };

    $.fn.fileinput.defaults = {
        showRemove: true,
        showUpload: true,
        captionClass: '',
        previewClass: '',
        mainClass: '',
        mainTemplate: null,
        previewTemplate: PREVIEW_TEMPLATE,
        captionTemplate: CAPTION_TEMPLATE,
        browseLabel: 'Browse …',
        browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>  ',
        browseClass: 'btn btn-primary',
        removeLabel: 'Remove',
        removeIcon: '<i class="glyphicon glyphicon-ban-circle"></i> ',
        removeClass: 'btn btn-default',
        uploadLabel: 'Upload',
        uploadIcon: '<i class="glyphicon glyphicon-upload"></i> ',
        uploadClass: 'btn btn-default',
        uploadUrl: null,
        msgLoading: 'Loading …',
        msgProgress: 'Loaded {percent}% of {file}',
        msgSelected: '{n} files selected',
        previewFileType: 'image',
        wrapTextLength: 250,
        wrapIndicator: ' <span class="wrap-indicator" title="{title}" onclick="{dialog}">[…]</span>',
        elCaptionContainer: null,
        elCaptionText: null,
        elPreviewContainer: null,
        elPreviewImage: null,
        elPreviewStatus: null
    };


    $(function () {
        var $element = $('input.file[type=file]');
        if ($element.length > 0) {
            $element.fileinput();
        }

    });

})(window.jQuery);

  $("#file-3").fileinput({
    showCaption: true,
    browseClass: "btn btn-primary btn-lg",
    fileType: ".pdf"
  });
    
    
});



  
  
  
  
  
  
  
  
  
</script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
#chart {
	width: 300px;
	height: 500px;
}


th {
  background-color: #f4f8f9;
}
.form-control{
  font-size: 17px !important;
  height: calc(2.25rem + 10px) !important;
}



/* 프로세스관련 */
.stepwizard-step p {
    margin-top: 5px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    margin-top: 30px;
    display: table;
    width: 90%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}

.btn-file {
    position: relative;
    overflow: hidden;
}

.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 80%;
    min-height: 80%;
    font-size: 999px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    background: red;
    cursor: inherit;
    display: block;
}

.file-caption-disabled {
    background-color: #EEEEEE;
    cursor: not-allowed;
    opacity: 1;
}

.file-input .btn[disabled], .file-input .btn .disabled {
    cursor: not-allowed;
}

.file-preview {
    border-radius: 5px;
    border: 1px solid #ddd;
    padding: 5px;
    width: 100%;
    margin-bottom: 5px;
}

.file-preview-frame {
    display: table;
    margin: 8px;
    height: 160px;
    border: 1px solid #ddd;
    box-shadow: 1px 1px 5px 0px #a2958a;
    padding: 6px;
    float: left;
    text-align: center;
}

.file-preview-frame:hover {
    background-color: #eee;
    box-shadow: 2px 2px 5px 0px #333;
}

.file-preview-image {
    height: 150px;
    vertical-align: text-center;
}

.file-preview-text {
    display: table-cell;
    width: 150px;
    height: 150px;
    color: #428bca;
    font-size: 11px;
    vertical-align: middle;
    text-align: center;
}

.file-preview-other {
    display: table-cell;
    width: 150px;
    height: 150px;
    font-family: Monaco, Consolas, monospace;
    font-size: 11px;
    vertical-align: middle;
    text-align: center;
}

.file-input-new .file-preview, .file-input-new .close, .file-input-new .glyphicon-file, .file-input-new .fileinput-remove-button, .file-input-new .fileinput-upload-button {
    display: none;
}

.loading {
    background: transparent url('../img/loading.gif') no-repeat scroll center center content-box !important;
}

.wrap-indicator {
    font-weight: bold;
    color: #245269;
    cursor: pointer;
}
.table th {
  font-size: 15px !important;
  font-weight: 600 !important;
}
.styleee {
  font-size: 15px !important;
  font-weight: 400 !important;
}

</style>
<section>
<br>
<br>
<br><br><br><br>
  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>목표 환전 예약하기</h3>
        </header>
      </div>
    </div>
    
    
    
    
    <div class="container">
    <div class="stepwizard">
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step">
                <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                <p><h1>환전신청내역</h1></p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                <p><h1>출금정보</h1></p>
            </div>
        </div>
    </div>
    <form method="post" action="${pageContext.request.contextPath }/exchange/doReserve" role="form">
        <div class="row setup-content" id="step-1">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <!-- <div class="row">
                        <div class="col-md-6">
                             <div class="form-group">
                        <label class="control-label">Cedula</label>
                        <input  maxlength="100" type="text" required="required" class="form-control" placeholder="Ingrese una cedula"  />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nombre</label>
                        <input maxlength="100" type="text" required="required" class="form-control" placeholder="Ingrese el nombre" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">1° Apellido</label>
                        <input maxlength="100" type="text" required="required" class="form-control" placeholder="Ingrese el 1° apellido" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">2° Apellido</label>
                        <input maxlength="100" type="text"

                            
                        </div>
                        <div class="col-md-6">
                                            <div class="form-group">
                        <label class="control-label">Correo</label>
                        <input maxlength="100" type="text" class="form-control" placeholder="Ingrese un correo" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Telefono</label>
                        <input maxlength="100" type="text"  class="form-control" placeholder="Ingrese un numero de telefono" />
                    </div>
                     <div class="form-group">
                        <label class="control-label">Direccion Exacta</label>
                        <textarea placeholder="Dirección Exacta" rows="4" cols="50"></textarea>
                        
                        
                    </div>
                            
                        </div>
                        
                    </div> -->
                    <br><br>
                    <!-- <h3>환전신청내역</h3> -->
                    <br><br>
                    <table style="width: 90%;" class="table">
                    <tr>
                      <th colspan="2">외화 매입 예약 통화</td>
                      <td colspan="2">
                        <select name="currencycode" id="currencycode" class="form-control" aria-describedby="inputGroupSuccess1Status">
                                  <option value="a" selected="selected"  disabled>- 통화를 선택하세요 -</option>
                                  <option value="USD">미국달러(USD)</option>
                                  <option value="EUR">유럽유로(EUR)</option>
                                  <option value="JPY">일본엔(JPY)</option>
                                  <option value="GBP">영국파운드(GBP)</option>
                                  <option value="CAD">캐나다달러(CAD)</option>
                                  <option value="CHF">스위스프랑(CHF)</option>
                                  <option value="HKD">홍콩달러(HKD)</option>
                                  <option value="AUD">호주달러(AUD)</option>
                                  <option value="SGD">싱가폴달러(SGD)</option>
                                  <option value="NZD">뉴질랜드달러(NZD)</option>
                                  <option value="CNY">중국위안(CNY)</option>
                                  <option value="THB">태국바트(THB)</option>
                                  <option value="MYR">말레이지아링기트(MYR)</option>
                                  <option value="TWD">대만달러(TWD)</option>
                                  <option value="PHP">필리핀페소(PHP)</option>
                                  <option value="IDR">인도네시아루피아(IDR)</option>
                                  <option value="AED">U.A.D디히람(AED)</option>
                                  <option value="VND">베트남동(VND)</option>
                          </select>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4">
                        <br>
                        <strong><h3>최근 3개월 동안의 지표</h3></strong>
                        <img id="style-img" class="centered " crossorigin="anonymous" src="" width="100%" align="center"  ></img>
                      </td>
                    </tr>
                    </table>
                    <br><br>
                    <table class="table" style="width: 90%;" >
                    <tr>
                      <th width="24.5%">현재 현찰살때의 가격</th>
                      <td width="24.5%"><span id="rate" name="rate"  class="styleee"></span>
                              <input type="hidden" id="rateHidden" name="rateHidden" value="">
                              <input type="hidden" id="basicrate" name="basicrate" value="">
                      </td>
                      <th width="24.5%">우대환율</th>
                      <td width="24.5%"><span id="commission2" name="commission2"  class="styleee"></span>
                              <input type="hidden" id="commission" name="commission" value="">
                      </td>
                    </tr>
                    <tr>
                      <th>매입 예약 환율</th>
                      <td><input type="text" id="reserverate" name="reserverate" onkeyup="keyevent(this);" placeholder ="목표환율을 입력하세요" class="form-control" aria-describedby="inputGroupSuccess1Status" ></td>
                      <th>우대 적용 환율</th>
                      <td><span id = "commrate" name = "commrate"  class="styleee"></span>
                             <input type="hidden" id="exchangerate" name="exchangerate" value="" >
                      </td>
                    </tr>
                    <tr>
                      <th>외화 매입 예약 금액</th>
                      <td><input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" placeholder ="환전 원하는 금액을 입력하세요" class="form-control" aria-describedby="inputGroupSuccess1Status" ></td>
                      <th>원화 출금 예정 금액</th>
                      <td><span id="exchangeChargeKRW" name="exchangeChargeKRW"  class="styleee"></span> 
                            <input type="hidden" id="exchangecharge" name="exchangecharge" value="" />
                      </td>
                    </tr>
                    </table>
                    
                    <!-- <table border="1" class="table table-bordered">

                      <tr>
                        <td colspan="3">

                          <strong><h3>최근 3개월 동안의 지표</h3></strong>
                          <img id="style-img" class="centered " crossorigin="anonymous" src="" width="90%" align="center" ></img>
                        </td>
                      </tr>
                      <tr>
                          <td colspan="3">
                              <span class="styleee">환전을 원하는 통화를 선택 및 금액을 입력하세요<br> 오늘의 현찰살때가격 : </span>
                              <span id="rate" name="rate"  class="styleee"></span>
                              <input type="hidden" id="rateHidden" name="rateHidden" value="">
                              <input type="hidden" id="basicrate" name="basicrate" value="">
                              
                          </td>

                      </tr>
                      <tr>
                          <td><select name="currencycode" id="currencycode" class="form-control" aria-describedby="inputGroupSuccess1Status">
                                  <option value="a" selected="selected"  disabled>- 통화를 선택하세요 -</option>
                                  <option value="USD">미국달러(USD)</option>
                                  <option value="EUR">유럽유로(EUR)</option>
                                  <option value="JPY">일본엔(JPY)</option>
                                  <option value="GBP">영국파운드(GBP)</option>
                                  <option value="CAD">캐나다달러(CAD)</option>
                                  <option value="CHF">스위스프랑(CHF)</option>
                                  <option value="HKD">홍콩달러(HKD)</option>
                                  <option value="AUD">호주달러(AUD)</option>
                                  <option value="SGD">싱가폴달러(SGD)</option>
                                  <option value="NZD">뉴질랜드달러(NZD)</option>
                                  <option value="CNY">중국위안(CNY)</option>
                                  <option value="THB">태국바트(THB)</option>
                                  <option value="MYR">말레이지아링기트(MYR)</option>
                                  <option value="TWD">대만달러(TWD)</option>
                                  <option value="PHP">필리핀페소(PHP)</option>
                                  <option value="IDR">인도네시아루피아(IDR)</option>
                                  <option value="AED">U.A.D디히람(AED)</option>
                                  <option value="VND">베트남동(VND)</option>
                          </select></td>
                          <td colspan="2">
                            <input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" placeholder ="환전 원하는 금액을 입력하세요" class="form-control" aria-describedby="inputGroupSuccess1Status" >
                          </td>
                      </tr>
                      <tr>
                        <td colspan="3">
                              목표가격 : <input type="text" id="reserverate" name="reserverate" onkeyup="keyevent(this);" placeholder ="목표환율을 입력하세요" class="form-control" aria-describedby="inputGroupSuccess1Status" >
                        </td>
                      </tr>
                      <tr>
                          <td colspan="2">
                              우대율 : <span id="commission2" name="commission2"  class="styleee"></span>
                              <input type="hidden" id="commission" name="commission" value="">
                          </td>
                      </tr>
                  </table> -->
                    
                    <button class="btn btn-outline-dark pull-right nextBtn" type="button" style="margin-right: 90px;" >다음으로</button>
                    
                    
                </div>
            </div>
        </div>
        <div class="row setup-content" id="step-2">
            <div class="col-xs-12">
                <div class="col-md-12">
                <br><br>
                    <!-- <h3>출금정보</h3> -->
                    <!-- <div class="form-group">
                        <label class="control-label">Estatura</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Ingrese una estatura" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Peso</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Ingrese un peso"  />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Tipo de sangre</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Seleccione tipo de sangre"  />
                    </div> -->
                    <br><br>
                    <table  class="table table-bordered" style="width: 90%">
                     <!--  <tr>
                          <td>
                                                              결제금액(원) : 
                            <span id="exchangeChargeKRW" name="exchangeChargeKRW"  class="styleee"></span> 
                            <input type="hidden" id="exchangecharge" name="exchangecharge" value="" />
                          </td>
                          <td>
                                                          적용 우대환율:
                            <span id = "commrate" name = "commrate"  class="styleee"></span>
                             <input type="hidden" id="exchangerate" name="exchangerate" value="" >
                          </td>
                      </tr> -->
                      <tr>
                        <th width="20%">마지막 환전일</th>
                        <td>
                          <input type="date" id="max_date" name="max_date" class="form-control" aria-describedby="inputGroupSuccess1Status" max="2021-09-23" /><br>
                          <p>마지막  환전일까지 목표 환율에 도달하지 못하면, 마지막 환전일 22시에 자동으로 환전이 진행됩니다.</p> 
                          <p>자동 환전을 원하지 않으시면 값을 비워주세요</p>
                        </td>
                      </tr>
                      <tr>
              <th>출금계좌번호</th>
              <td>
                <select name="account_num" id="account_num" class="account_num form-control" class="form-control" aria-describedby="inputGroupSuccess1Status" >
                  <option value="a" selected disabled  >- 출금 계좌를 선택하세요 -</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>계좌비밀번호</th>
              <td>
                <input type="password" id="bank_name" name="bank_name" class="form-control" aria-describedby="inputGroupSuccess1Status" />
                <input type="hidden" id="pwd" name="pwd" >
               </td>
            </tr>
                  </table>
                    <button class="btn btn-outline-dark pull-right" id="subm" name="subm" style="margin-right: 90px;" >환전하기</button>
                    <!-- <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button> -->
                </div>
            </div>
        </div>
           <!--   <div class="row setup-content" id="step-3">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3> Dirección</h3>
                    <div class="form-group">
                        <label class="control-label">Provincia</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Aquí va a haber un dropdown para proviencia" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Canton</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Aquí va a haber un dropdown para proviencia"  />
                    </div>
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
                </div>
            </div>
        </div>
            <div class="row setup-content" id="step-4">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3>  Deporte</h3>
                    <div class="form-group">
                        <label class="control-label">Seleccione un deporte</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Seleccione un deporte" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Seleccione una categoria</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Seleccione una categoria"  />
                    </div>
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
                </div>
            </div>
        </div>
            <div class="row setup-content" id="step-5">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3> Imagenes</h3>
                    <div class="container">
            
                    <div class="form-group">
                        <h3>Foto cédula frente</h3>
                        <input id="file-1" type="file" class="file" multiple=false data-preview-file-type="image">
                    </div>
                    <div class="form-group">
                        <h3>Foto cédula atras</h3>
                        <input id="file-1" type="file" class="file" multiple=false data-preview-file-type="image">
                    </div>
                
            </div>
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
                </div>
            </div>
        </div>
        <div class="row setup-content" id="step-6">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3> Formulario</h3>
                    <div class="container">
                        
                    <div class="form-group">
                        <h3>Boleta de inscripción</h3>
                        <input id="file-1" type="file" class="file" multiple=false data-preview-file-type="text">
                    </div>
                    <div class="form-group">
                        <h3>Pase cantonal</h3>
                        <input id="file-1" type="file" class="file" multiple=false data-preview-file-type="text">
                    </div>
            </div>
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
                </div>
            </div>
        </div>
        <div class="row setup-content" id="step-7">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3> ¡Fomulario Completado!!!</h3>
                    <button class="btn btn-success btn-lg pull-right" type="submit">Enviar</button>
                </div>
            </div>
        </div>-->
        
        
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>  <!-- 여기에 제목넣기 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div> <!-- 여기에 내용 넣기 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_cancel" onclick="return false" >취소</button>
                    <input type="submit"  class="btn btn-success btn-md"  value="확인" disabled="disabled"  >
              </div>
            </div>
          </div>
          </div>
        
    </form>
    </div>  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  </div>
</section>























<br>
<br>
<br>
<br>
<br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>