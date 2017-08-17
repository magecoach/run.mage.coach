#!/usr/bin/env nodejs
"use strict";

var plugins = [];
var context = {};
var options = {};

if(!fs) {
    var fs = require("fs");
}

function log(s)
{
    fs.writeFileSync('/run.mage.coach/log', s + '\n', {'flag' : 'a'});
}
log("\n-----");

function processFile(name, fullname, stat)
{
    if(stat.isDirectory())
    {
        processDir(fullname, fs.readdirSync(fullname));
    }else if(stat.isFile())
    {
        if(name === "index.js" && fullname !== __dirname+"/index.js")
        {
            log("module found! "+ fullname);
            var plugin = require(fullname);
            if(typeof plugin.name === "function")
            {
                plugins.push(plugin);
                if(typeof plugin.open === "function")
                {
                    log("Calling open on " + plugin.name());
                    plugin.open(context, options, log);
                }
            }else
            {
                log(fullname + " does not have a name function!, not using it");
            }
        }
    }
}

function processDir(basedir, dirname)
{
    dirname.forEach(function(name)
    {
        var fullname = basedir + "/" + name;

        processFile(name, fullname, fs.statSync(fullname));
    });
}

module.exports = {
    name()
    {
        return "magecoach_plugin_loader";
    },
    open(context, options)
    {
        log("open start");
        this.context = context;
        this.options = options;

        //Loops through dirs, adds all plugins, and calls their open (if available)
        processDir(__dirname, fs.readdirSync(__dirname));
        log("open end");
    },
    postOpen()
    {
        log("postOpen start");
        plugins.forEach(function(plugin)
        {
           if(typeof plugin.postOpen === "function")
           {
               log("Calling postOpen on " + plugin.name());
               plugin.postOpen();
           }
        });
        log("postOpen end");
    },
    close()
    {
        log("close start");
        plugins.forEach(function(plugin)
        {
           if(typeof plugin.close === "function")
           {
               log("Calling close on " + plugin.name());
               plugin.close();
           }
        });
        log("close end");
    },
    postClose()
    {
        log("postClose start");
        plugins.forEach(function(plugin)
        {
           if(typeof plugin.postClose === "function")
           {
               log("Calling postClose on " + plugin.name());
               plugin.postClose();
           }
        });
        log("postClose end");
    },
    processMessage(message)
    {
        processMessage(message, null);
    },
    processMessage(message, queue)
    {
        log("processMessage start");
        plugins.forEach(function(plugin)
        {
           if(typeof plugin.processMessage === "function")
           {
               log("Calling processMessage on " + plugin.name());
               plugin.processMessage(message, queue);
           }
        });
        log("processMessage end");
    }
};
