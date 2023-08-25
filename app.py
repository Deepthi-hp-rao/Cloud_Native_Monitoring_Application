import psutil #this module provide CPU and Memory matric
from flask import Flask, render_template #Python web framework that provides useful tools and features for creating web applications in the Python

app = Flask(__name__)

@app.route("/") #path where the application is going to run
def index():
    cpu_metric = psutil.cpu_percent() #var store the value of cpu usage
    mem_metric = psutil.virtual_memory().percent #var store the value of memory usage
    Message = None #if both percent more than 80 then display msg
    if cpu_metric > 80 or mem_metric > 80:
        Message = "High CPU or Memory Detected, scale up!!!"
    return render_template("index.html", cpu_metric=cpu_metric, mem_metric=mem_metric, message=Message)

if __name__=='__main__':
    app.run(debug=True, host = '0.0.0.0', port = '18080')
