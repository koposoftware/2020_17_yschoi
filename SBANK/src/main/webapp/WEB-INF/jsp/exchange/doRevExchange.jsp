<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <jsp:include page="/head.jsp" />  --%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>


<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">







 



function keyevent() {

  var exchangeCharge = document.getElementById("exchangeprice").value; //환전금액(외화)
  var commrate = document.getElementById("commrate").innerHTML; //우대적용환율

  //alert(exchangeCharge)
  //alert(commrate)

  exchangeChargeKRW = exchangeCharge * commrate
  exchangeChargeKRW = exchangeChargeKRW.toFixed(2)

  document.getElementById("exchangeChargeKRW").innerHTML = exchangeChargeKRW; //환전금액(원) 값 띄어주기

  var commrate = document.getElementById("commrate").innerHTML;

  /* alert(typeof(commrate));
  alert(typeof(exchangeChargeKRW)); */

  document.getElementById('exchangerate').value = commrate; // hidden필드에 값 넣어주기
  document.getElementById('exchangecharge').value = exchangeChargeKRW; // hidden필드에 값 넣어주기

  exchangeChargeKRW = "";
  commrate = "";

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




$(document).ready(function() {
  $('#currencycode').change(function() {
    
    
    let currency = $(this).val(); // 통화코드추출
    //alert(currency)
    
    $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/getRateCommission/'+currency,
      type : 'get',
      success : function(data) {
        let list = JSON.parse(data);
        console.log(list)
        
        let rate =list.cashsellrate; /* 송금받을때 */
        let basicrate=list.basicrate; /* 매매기준율 */
        let commission = list.commission;
        let commrate = basicrate - ((rate-basicrate)*commission); //실제로 적용될 환율임
        
        $("#rate").text((list.cashsellrate).toFixed(2));
        $("#commrate").text(commrate.toFixed(2));
        $("#commission").text(list.commission2);
        
        /* document.getElementById('rateHidden').value = list.commission2; */
        
        rate="";
        basicrate="";
        commission="";
        commrate=""; 
      }, 
      error : function() {
        alert('실패')
      }, complete : function() {
              /* 뭘해줘야할까 */
      }
    })
    
    
    
    
    
    
    
    
    
  });
  


});





/* $(document).ready(function() {
  $('#account_num_from').change(function() {
    
    let realpwd = $("#account_num_from > option:selected").attr('id'); // 선택된 옵션의 id의 값을 가져오기
    $("input[type=hidden][name=pwd]").val(realpwd); // hidden에 방금 선택한 계좌의 비밀번호 값 저장
    


  });
}); */





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
            $("#setresult").text('아래 확인 버튼을 눌러 재환전을 진행하여주세요.');
            $("input[type=submit]").prop('disabled',false);
          } else{
            $("#setresult").text('')
            $("#setresult").text('인증코드를 확인하여주세요')
          }

          return false;
        }, 
        error : function() {
          alert('실패')
        }
      });
    }
    
  });// 구글 OTP인증코드 적으면 함수 끝

  
  
  
  
  
  
  
  
  
  
  
  
  
  $(document).on('click', '#subm', function() {  //모달에서 확인버튼 누르면 함수
    
    let iptval = $('#exchangeprice').val();  // 사용자가 입력할 재환전 할 금액
    let ownval = $("#currencycode > option:selected").attr('id'); // 사용자가 선택한 외화의 잔액
    iptval = iptval * 1;
    ownval = ownval * 1;
    /* alert(typeof(iptval))
    alert(typeof(ownval))  */
    
    if(iptval>ownval){
      $(".modal-title").append("재환전하기");
      $(".modal-body").append('선택하신 외화의 잔액을 확인해주세요. 외화가 부족합니다.');
      $("input[type=submit]").prop('disabled',true);
      $("#exampleModal").modal("show");
      return false;
    }
    
    //금액에는 문제없음. 비밀번호 확인하지
    let realpwd = $("#account_num_from > option:selected").attr('id'); //실제 계좌의 비번
    let iptpwd = $("#reg_date").val(); //사용자가 입력한 해싱 전의 계좌번호
    /* alert(realpwd)
    alert(iptpwd) */
    var afterHashIpt='';
    
    $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/returnHash/'+iptpwd,
      type : 'get',
      async:false,
      success : function(data) {
        var list = JSON.parse(data);
        afterHashIpt=list;
        /* alert(typeof(list)) */
      }, 
      error : function() {
        alert('실패')
      
        return false;
      }
    });
    
    
    /* alert(afterHashIpt) */
    if(afterHashIpt == realpwd){
      
      var strr='';
      
      /*
      $.ajax({
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
      
      strr+='재환전을 원하시면 Google OTP로 본인인증을 진행하여주세요.<br><br>';
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
      strr+='  code : <input  name="user_code" id="user_code"  type="text" ">';
      strr+='  <input name="encodedKey" type="hidden" readonly="readonly" value="a"><br><br>';
      strr+='  <span id="setresult" name="setresult" ></span<br><br>';
      /* strr+='  <input type="submit" value="전송!">'; */
      /* strr+='</form>'; */
      
      $(".modal-title").append("재환전하기");
      $(".modal-body").append(strr);
      /* $("input[type=submit]").prop('disabled',false); */
      let aa =$("#exampleModal").modal("show");
      return false;
      if(aa){
        return true;
      }
    } else{
      $(".modal-title").append("재환전하기");
      $(".modal-body").append('선택하신 계좌(외화가 출금 될)의 비밀번호를 확인해주세요.');
      $("input[type=submit]").prop('disabled',true);
      $("#exampleModal").modal("show");
      return false;
    }
    
    
    
    return false;
    
  })// 구글 OTP인증코드 적으면 함수 끝
  
});
















///////////////////프로세스 관련
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

</style>




<section>


  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>재환전하기</h3>
        </header>
      </div>
    </div>



    
    <div class="container">
    <div class="stepwizard">
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step">
                <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                <p>환전신청내역</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                <p>출금정보</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                <p>입금정보</p>
            </div>
            
            <!-- <div class="stepwizard-step">
                <a href="#step-4" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
                <p>Deporte</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-5" type="button" class="btn btn-default btn-circle" disabled="disabled">5</a>
                <p>Imagenes</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-6" type="button" class="btn btn-default btn-circle" disabled="disabled">6</a>
                <p>Formulario</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-7" type="button" class="btn btn-default btn-circle" disabled="disabled">7</a>
                <p>Completado</p>
            </div> -->
            
        </div>
    </div>
    <form method="post" action="${pageContext.request.contextPath }/exchange/doRevExchange" role="form">
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
                        <input maxlength="100" type="text" required="required" class="form-control" placeholder="Ingrese el 2° apellido" />
                    </div>
                            
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
                    
                    <h3>환전신청내역</h3>
                    <table border="1" class="table table-bordered">
                      <tr>
                        <th>통화종류</th>
                        <td><select name="currencycode" id="currencycode" onchange="chageCurrencySelect()" class="form-control" aria-describedby="inputGroupSuccess1Status">
                            <option value="a" selected disabled>- 재환전 할 통화를 선택하세요 -</option>
                            <c:forEach items="${curlist}" var="account" varStatus="loop">
                              <option value="${account.currencycode}" id="${account.balance}">통화 : ${account.currencycode}, 잔액 : ${account.balance}</option>
                            </c:forEach>
                        </select></td>
                      </tr>
                      <tr>
                        <th>환전금액(외화)</th>
                        <td><input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" class="form-control" aria-describedby="inputGroupSuccess1Status" /></td>
                      </tr>
                      <tr>
                        <th>현재 고시환율(원)</th>
                        <td>
                          <span id="rate" name="rate"></span> 
                          <!-- <input type="hidden" id="rateHidden" name="rateHidden" value=""> -->
                        </td>
                      </tr>
                      <tr>
                        <th>우대 적용환율(원)</th>
                        <td>
                          <span id="commrate" name="commrate"></span> 
                          <input type="hidden" id="exchangerate" name="exchangerate" value="">
                        </td>
                      </tr>
                      <tr>
                        <th>우대율(%)</th>
                        <td><span id="commission" name="commission"></span></td>
                      </tr>
                      <tr>
                        <th>환전금액(원)</th>
                        <td>
                          <span id="exchangeChargeKRW" name="exchangeChargeKRW"></span> 
                          <input type="hidden" id="exchangecharge" name="exchangecharge" value="" />
                        </td>
                      </tr>
                    </table>
                    
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >다음으로</button>
                </div>
            </div>
        </div>
        <div class="row setup-content" id="step-2">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3>출금정보</h3>
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
                    <table border="1" class="table table-bordered">
                      <tr>
                        <th>출금계좌번호</th>
                        <td>
                          <select name="account_num_from" id="account_num_from" class="form-control" aria-describedby="inputGroupSuccess1Status">
                            <option value="a" selected disabled>- 외화 출금 할 계좌를 선택하세요 -</option>
                            <c:forEach items="${accountCurList}" var="account" varStatus="loop">
                              <option value="${account.account_num}" id="${account.bank_name}">외화계좌번호 : ${account.account_num}</option>
                            </c:forEach>
                        </select>
                        </td>
                      </tr>
                      <tr>
                        <th>계좌비밀번호</th>
                        <td>
                          <input type="password" id="reg_date" name="reg_date" class="form-control" aria-describedby="inputGroupSuccess1Status" placeholder="출금 계좌의 비밀번호를 입력하세요" /> 
                          <!-- <input type="hidden" id="pwd" name="pwd"> -->
                        </td>
                      </tr>
                    </table>
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >다음으로</button>
                </div>
            </div>
        </div>
        <div class="row setup-content" id="step-3">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3>입금정보</h3>
                    <!-- <div class="form-group">
                        <label class="control-label">Provincia</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Aquí va a haber un dropdown para proviencia" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">Canton</label>
                        <input maxlength="200" type="text" required="required" class="form-control" placeholder="Aquí va a haber un dropdown para proviencia"  />
                    </div> -->
                    <table border="1" class="table table-bordered">
                      <tr>
                        <th>입금계좌번호</th>
                        <td>
                        <select name="account_num_to" id="account_num_to" class="form-control" aria-describedby="inputGroupSuccess1Status">
                            <option value="a" selected disabled>- 입금 계좌를 선택하세요 -</option>
                            <c:forEach items="${accountList}" var="account" varStatus="loop">
                              <option value="${account.account_num}">계좌번호 : ${account.account_num}, 잔액 : ${account.balance}</option>
                            </c:forEach>
                        </select>
                        </td>
                      </tr>
                    </table>
                    <!-- <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button> -->
                    <button class="btn btn-outline-dark pull-right" id="subm" name="subm" data-toggle="modal" data-target="#myModal">환전하기</button>
                </div>
            </div>
        </div>
        
        
        
        
        
        
            <!-- <div class="row setup-content" id="step-4">
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
        </div> -->
        
        
        
        
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <!-- 여기에 제목넣기 -->
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body"></div>
              <!-- 여기에 내용 넣기 -->
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_cancel" onclick="return false">취소</button>
                <input type="submit" class="btn btn-success btn-md" value="확인" disabled="disabled">
              </div>
            </div>
          </div>
        </div>
        
        
        
        
    </form>
    </div>
    




  </div>
</section>




<br><br><br><br><br>
<!-- 수정할부분 끝 -->






<%-- <%@ include file="/foot.jsp"%> --%>
<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>