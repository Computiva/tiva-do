#! /usr/bin/python

import os
import re

import redis

print "HTTP/1.1 200 Ok"
print "Content-Type: text/html"
print ""
redis_cli = redis.StrictRedis(host="127.0.0.1", port=6379, db=0)
task_id = os.environ["QUERY_STRING"]
select_option = str()
for line in open("/srv/tiva/static/do/create.haml.html").readlines():
    if re.search(r"<input.*>", line):
        if "type='text'" in line:
            field = re.search(r"name='([a-z0-9_]+)'", line).groups()[0]
            value = redis_cli.get("do:task:%s:%s" % (task_id, field))
            print "<input type='text' name='%s' value='%s'>" % (field, value)
        elif "type='checkbox'" in line:
            field = re.search(r"name='([a-z0-9_]+)'", line).groups()[0]
            value = redis_cli.get("do:task:%s:%s" % (task_id, field))
            print "<input type='checkbox' name='%s'" % field,
            if value == "on":
                print "checked",
            print ">"
        else:
            print line
    elif re.search(r"<select.*>", line):
        field = re.search(r"name='([a-z0-9_]+)'", line).groups()[0]
        value = redis_cli.get("do:task:%s:%s" % (task_id, field))
        select_option = value
        print line
    elif re.search(r"<option.*>", line):
        value = re.search(r"value='([a-z0-9_]+)'", line).groups()[0]
        text = re.search(r">([^<]+)<", line).groups()[0]
        print "<option value='%s'" % value,
        if select_option == value:
            print "selected",
        print ">%s</option>" % text
    elif re.search(r"</select>", line):
        select_option = str()
        print line
    elif re.search(r"^ *<h1>Create task</h1>", line):
        print "<h1>Edit task</h1>"
    elif re.search(r"<form action='/do/create' method='POST'>", line):
        print "<form action='/do/edit' method='POST'>"
        print "<input type='hidden' name='id' value='%s'>" % task_id
    elif re.search(r"<span class='icon-add'></span>", line):
        print "<span class='icon-edit'></span>"
    elif re.search(r"^ *Create$", line):
        print "Update"
    else:
        print line
