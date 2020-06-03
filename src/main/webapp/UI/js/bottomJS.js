//summernote
        $('#summernote').summernote({
            placeholder: '내용을 입력하세요.',
            tabsize: 2,
            width:800,
            height: 200,
            toolbar: [
              ['style', ['style']],
              ['font', ['bold', 'underline', 'clear']],
              ['color', ['color']],
              ['para', ['ul', 'ol', 'paragraph']],
              ['table', ['table']],
              ['insert', ['link', 'picture', 'video']],
              ['view', ['fullscreen', 'codeview', 'help']]
            ]
          });
//file
        $(function(){   

            $("button").focus(function(){
               $(this).blur();
            });

            $('input[type="file"]').each(function(){
               $(this).on( "change", function() {         
                   var fileName = $(this).val(); // 파일경로
                   var fileReName = fileName.split("\\")[fileName.split("\\").length - 1]; // 파일명만 남김
                   $(this).siblings('.file_name').text(fileReName); // 출력
               });
            });

            $('input[type="checkbox"]').each(function(){
               $(this).on( "change", function() {         
                  if($(this).is(":checked")){
                     $(this).siblings('label').addClass('on');
                  }else{
                     $(this).siblings('label').removeClass('on');
                  }
               });
            });

            $('.radiotype').each(function(){
               var $this = $(this).find('input[type="radio"]');
               $this.on("change", function() {      
                  $(this).siblings('label').addClass('on');
                  $this.not(this).siblings('label').removeClass('on');
               });
            });
         });
