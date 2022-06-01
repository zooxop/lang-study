var navbar = {
    init : function (){
        var _this = this;
        $('#new-api').on('click', function (){
            _this.newApi();
        });
        $('#save-api').on('click', function (){
            _this.saveApi();
        });
        $('#cancel-api').on('click', function(){
            _this.goBack();
        });
    },
    newApi : function () {
        window.location.href = '/new-api';
    },
    saveApi : function () {

        //API Type(select or ins/upd/del) 라디오버튼 선택값 가져오기.
        const apiTypeList = document.getElementsByName('api-type');
        let apiTypeIndex;
        apiTypeList.forEach((node) => {
            if (node.checked) {
                apiTypeIndex = node.value;
            }
        });

        let paramCount = 0;
        var aJsonArray = new Array();

        $('#param-table > tr').each(function (index, item){
            let paramName = $(this).find("input[name=paramName]").val();
            let paramDesc = $(this).find("input[name=paramDesc]").val();
            let recordId = $(this).find("input[name=paramRecordId]").val();

            let aJson = new Object();

            aJson.paramSeq = ++paramCount;
            aJson.paramName = paramName;
            aJson.paramDesc = paramDesc;
            aJson.recordId = recordId;

            let requestId = $('#loaded-api-id').val();
            if (requestId != null){
                aJson.requestId = requestId;
            }

            aJsonArray.push(aJson);
        });

        console.log(aJsonArray);


        var apiRequestDto = {
            recordId: $('#loaded-api-id').val(),
            apiName: $('#api-name').val(),
            apiDesc: $('#api-desc').val(),
            apiType: apiTypeIndex,
            apiPath: $('#api-path option:selected').val(),
            apiQuery: $('#api-query').val(),
            apiStatus: $('#temp-api-status option:selected').val(),  //API 진행상태. 1:신규, 2:진행중, 3:처리완료.
            createdId: $('#session-user-name').val(),
            modifiedId: $('#session-user-name').val(),
            apiRequestParams: aJsonArray
        };


        $.ajax({
            type: 'POST',
            url: '/api/request/save',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(apiRequestDto)
        }).done(function () {
            alert('API 생성 요청이 완료되었습니다.');
            window.location.href = '/files';
        }).fail(function (xhr, error) {
            if (error.status = 400){
                let msg = JSON.parse(xhr.responseText);
                alert(msg.detail);
            } else {
                alert(JSON.stringify(error));
            }
        });
    },
    goBack : function () {
        window.history.back();
    }
};

navbar.init();