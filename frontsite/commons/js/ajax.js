function getDomDocumentPrefix()
{
    if (getDomDocumentPrefix.prefix)
        return getDomDocumentPrefix.prefix;

    var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
    var o;
    for (var i = 0; i < prefixes.length; i++)
    {
        try
        {
            // try to create the objects
            o = new ActiveXObject(prefixes[i] + ".DomDocument");
            return getDomDocumentPrefix.prefix = prefixes[i];
        }
        catch (ex)
        {
        }
        ;
    }
    throw new Error("Could not find an installed XML parser");
}

function getXmlHttpPrefix()
{
    if (getXmlHttpPrefix.prefix)
        return getXmlHttpPrefix.prefix;

    var prefixes = ["MSXML2", "Microsoft", "MSXML", "MSXML3"];
    var o;
    for (var i = 0; i < prefixes.length; i++)
    {
        try
        {
            // try to create the objects
            o = new ActiveXObject(prefixes[i] + ".XmlHttp");
            return getXmlHttpPrefix.prefix = prefixes[i];
        }
        catch (ex)
        {
        }
        ;
    }
    throw new Error("Could not find an installed XMLHttp object");
}

function XmlHttp()
{
    
}

XmlHttp.create = function ()
{
    try
    {
        // NS & MOZ
        if (window.XMLHttpRequest)
        {
            var req = new XMLHttpRequest();

            // some versions of Moz do not support the readyState property
            // and the onreadystate event so we patch it!
            if (req.readyState == null)
            {
                req.readyState = 1;
                req.addEventListener("load", function ()
                {
                    req.readyState = 4;
                    if (typeof req.onreadystatechange == "function")
                        req.onreadystatechange();
                }, false);
            }

            return req;
        }
        // IE
        if (window.ActiveXObject)
        {
            return new ActiveXObject(getXmlHttpPrefix() + ".XmlHttp");
        }
    }
    catch (ex)
    {
    }
    // Fail
    throw new Error("Your browser does not support XmlHttp objects");
};

function XmlDocument()
{
}
XmlDocument.create = function ()
{
    try
    {
        if (document.implementation && document.implementation.createDocument)
        {
            var doc = document.implementation.createDocument("", "", null);
            if (doc.readyState == null)
            {
                doc.readyState = 1;
                doc.addEventListener("load", function ()
                {
                    doc.readyState = 4;
                    if (typeof doc.onreadystatechange == "function")
                        doc.onreadystatechange();
                }, false);
            }

            return doc;
        }
        if (window.ActiveXObject)
            return new ActiveXObject(getDomDocumentPrefix() + ".DomDocument");
    }
    catch (ex)
    {
    }
    throw new Error("Your browser does not support XmlDocument objects");
};

if (window.DOMParser &&
    window.XMLSerializer &&
    window.Node && Node.prototype && Node.prototype.__defineGetter__)
{

    Document.prototype.loadXML = function (s)
    {

        var doc2 = (new DOMParser()).parseFromString(s, "text/xml");

        while (this.hasChildNodes())
            this.removeChild(this.lastChild);
        for (var i = 0; i < doc2.childNodes.length; i++)
        {
            this.appendChild(this.importNode(doc2.childNodes[i], true));
        }
    };

    Document.prototype.__defineGetter__("xml", function ()
    {
        return (new XMLSerializer()).serializeToString(this);
    });
}

/*
 * xmlHttp Pool
 *
 * userage: var xmlhttpObj = XmlHttpPool.pick()
 */
var XmlHttpPoolArr = new Array();
var XmlHttpPoolSize = 100;
var XHPCurrentAvailableID = 0;

function XmlHttpPool()
{
}
XmlHttpPool.pick = function()
{
    var pos = XHPCurrentAvailableID;
    XmlHttpPoolArr[pos] = XmlHttp.create();

    XHPCurrentAvailableID >= (XmlHttpPoolSize - 1) ? 0 : XHPCurrentAvailableID++

    return XmlHttpPoolArr[pos];
}

/**
  ????????
  aync:????????????
  url:??????????????url
  method:??????????????GET??POST
  data:??????????
  callback:??????????
**/
function rpcCall(asyn, url, method, data, callback)
{
    // ????????????????
    if (url.indexOf("?") > 0)
    {
        url += "&randnum=" + Math.random();
    }
    else
    {
        url += "?randnum=" + Math.random();
    }

    var xmlhttp = XmlHttp.create();
    xmlhttp.open(method, url, asyn);
    xmlhttp.setRequestHeader("Content-length",data.length);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(data);
    if (!asyn)
    {
        if(callback)
        {
            callback(xmlhttp.responseText);
        }
    }
    else
    {
        xmlhttp.onreadystatechange = function()
        {
            if (xmlhttp.readyState == 4 && (xmlhttp.status == 200 || xmlhttp.status == 304))
            {
                if(callback)
                {
                   callback(xmlhttp.responseText);
                }
            }
        }
    }
}

/**
????????,????????????callback????
callback:??????????????????????callback(text)????
**/
function asynCall(url, callback)
{
    // ????????????????
    if (url.indexOf("?") > 0)
    {
        url += "&randnum=" + Math.random();
    }
    else
    {
        url += "?randnum=" + Math.random();
    }
			
    var xmlhttp = XmlHttp.create();
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && (xmlhttp.status == 200 || xmlhttp.status == 304))
        {
            if (callback)
            {
                callback(xmlhttp.responseText);
            }
        }
    }
    xmlhttp.open("GET", url, true);
    
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  
    xmlhttp.send(null);
}

/**
????????,????????????callback????
callback:??????????????????????callback(p_xml)???? ????xml????
**/
function asynCallXml(url, callback)
{
    // ????????????????
    if (url.indexOf("?") > 0)
    {
        url += "&randnum=" + Math.random();
        
    }
    else
    {
        url += "?randnum=" + Math.random();
        
    }
	
    var xmlhttp = XmlHttp.create();
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && (xmlhttp.status == 200 || xmlhttp.status == 304))
        {
            if (callback)
            {
                callback(xmlhttp.responseXML);
            }
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(null);
}

/**
  ????????????????????????????????????id????????????
  url:??????????url
  id:????????????????????ID????
**/
function asynSetContent(url, id)
{
    // ????????????????
    if (url.indexOf("?") > 0)
    {
        url += "&randnum=" + Math.random();
    }
    else
    {
        url += "?randnum=" + Math.random();
    }

    var xmlhttp = XmlHttp.create();
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && (xmlhttp.status == 200 || xmlhttp.status == 304))
        {
            var obj = document.getElementById(id);
            if (obj)
            {
                obj.innerHTML = xmlhttp.responseText;
            }
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(null);
}





