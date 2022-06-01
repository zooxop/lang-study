let paramCount = 0;
var apiPage = {
    init : function (){
        var _this = this;
        $('#new-item').on('click', function (){
            _this.newItem("","", "");
        });

        let isOldPage = $('#is-old-page').val();  //신규가 아닐 때
        if (isOldPage) {
            _this.loadItem();
        }
    },
    newItem : function (recordId, paramName, paramDesc) {
        paramCount++;

        const paramTable = document.getElementById("param-table");

        let varTr = document.createElement('tr');
        varTr.id = 'params'+paramCount.toString();
        varTr.classList.add('classTest');

        let td1 = document.createElement('td');
        let inputText = document.createElement('input');
        inputText.id = 'paramName'+paramCount.toString();
        inputText.name = 'paramName';
        inputText.setAttribute('type', 'text');
        inputText.setAttribute('placeholder', 'Parameter');
        inputText.classList.add('variable-input');
        inputText.value = paramName;
        td1.appendChild(inputText);

        let td2 = document.createElement('td');
        let inputText2 = document.createElement('input');
        inputText2.id = 'paramDesc'+paramCount.toString();
        inputText2.name = 'paramDesc';
        inputText2.setAttribute('type', 'text');
        inputText2.setAttribute('placeholder', '설명');
        inputText2.classList.add('variable-input');
        inputText2.value = paramDesc;
        td2.appendChild(inputText2);

        let td3 = document.createElement('td');
        let newButton = document.createElement('button');
        newButton.classList.add('btn');
        newButton.classList.add('btn-danger');
        newButton.classList.add('new-api-buttons');
        newButton.innerHTML = '삭제';
        newButton.addEventListener('click', this.removeOn);
        td3.appendChild(newButton);

        let recordIdHidden = document.createElement('input');
        recordIdHidden.id = 'paramRecordId'+paramCount.toString();
        recordIdHidden.name = 'paramRecordId'
        recordIdHidden.setAttribute('type', 'hidden');
        recordIdHidden.value = recordId;

        varTr.appendChild(td1);
        varTr.appendChild(td2);
        varTr.appendChild(td3);
        varTr.appendChild(recordIdHidden);

        paramTable.appendChild(varTr);

    },
    removeOn : function (event) {
        let tId = event.target.parentElement.parentElement.id;
        const varTr = document.getElementById(tId);
        varTr.remove();
    },
    loadItem : function (){
        let apiName = $('#loaded-api-name').val();
        let apiPath = $('#loaded-api-path').val();
        let apiDesc = $('#loaded-api-desc').val();
        let apiQuery = $('#loaded-api-query').val();
        let apiType = $('#loaded-api-type').val();
        let apiStatus = $('#loaded-api-status').val();

        $('#api-name').val(apiName);
        $('#api-desc').val(apiDesc);
        $('#api-query').val(apiQuery);

        //apiPath <select> > <option> 찾아서 selected 처리.
        $("#api-path").val(apiPath).attr("selected", "selected");

        //apiStatus <select> > <option> 찾아서 selected 처리.
        $("#temp-api-status").val(apiStatus).attr("selected", "selected");

        //ApiType RadioButton 체크.
        const apiTypeList = document.getElementsByName('api-type');
        apiTypeList.forEach((node,index) => {
            if ((index+1) == apiType) {
                node.checked = true;
            } else {
                node.checked = false;
            }
        });

        const apiParams = document.getElementsByClassName("loaded-params");
        Array.from(apiParams).forEach((node, index) => {
            const paramRecordId = node.getElementsByClassName("loaded-param-id")[0].value;
            const paramName = node.getElementsByClassName("loaded-param-name")[0].value;
            const paramDesc = node.getElementsByClassName("loaded-param-desc")[0].value;
            this.newItem(paramRecordId, paramName, paramDesc);
        });
    }
};

var requestList = {
    init : function (){
        var _this = this;

        //최초 화면 열릴 때 selected 설정.
        var statusCode = $('#request-status').val();

        $('#api-status').val(statusCode).prop('selected', true);

        $('#api-status').on('change', function (){
            _this.changeStatus();
        });
    },
    changeStatus :function (){
        let status = '/' + $('#api-status option:selected').val();
        window.location.href = '/api/request/list' + status;
    }
}

apiPage.init();
requestList.init();