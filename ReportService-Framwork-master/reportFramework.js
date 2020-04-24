/**
 * 
 * @param {Number} aid Your app id given to you
 * @param {String} [reportBy="Logger"] The log is reported by the param specified 
 */
var Logger = function (aid, reportBy) {
    this.serverUrl = 'http://localhost:3000/logs';
    this.aid = aid;
    this.reportBy = typeof (reportBy) == 'string' ? reportBy : "Logger";
}

/**
 * @param {String} message The message to be logged
 * @param {String} [logType = "Error"] The type of the log 
 */
Logger.prototype.log = function (message, logType) {
    var self = this;
    if (typeof (message) == 'object') {
        if (message.toString() != "[object Object]") {
            message = message.toString();
        }
        else {
            message = JSON.stringify(message);
        }
    }

    return new Promise((resolve, reject) => {
        fetch(this.serverUrl, {
            method: "post",
            body: JSON.stringify({
                aid: self.aid,
                message: message,
                logType: logType,
                reportBy: self.reportBy
            })
        })
            .then(res => res.json())
            .then(data => resolve(data))
            .catch(err => reject(err));

    })
}

