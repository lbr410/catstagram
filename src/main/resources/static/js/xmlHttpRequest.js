let XHR = null;

function getXHR() {
    if(window.ActiveXObject) {
        return new ActiveXObject('Msxml')
    } else if(window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else {
        return null;
    }
}

function sendRequest(url, params, callback, method) {
    XHR = getXHR();

    let newMethod = method ? method : 'GET';
    if(newMethod != 'GET' && newMethod != 'POST') {
        newMethod = 'GET';
    }

    let newParams = (params == null || params == '') ? null : params;
    let newUrl = url;
    if(newMethod == 'GET' && newParams != null) {
        newUrl = newUrl + '?' + newParams;
    }

    XHR.onreadystatechange = callback;
    XHR.open(newMethod, newUrl, true);
    XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    XHR.send(newMethod == 'POST' ? newParams : null);
}