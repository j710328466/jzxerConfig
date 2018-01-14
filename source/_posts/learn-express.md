---
title: learn express
date: 2017-12-20 10:27:29
tags: [web前端, express]
categories: express
---

## 深入了解express

### 构建一个 express 实例
> cnpm i express-generator -g

### 目录结构
```
.
├── app.js
├── bin
│   └── www
├── package.json
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── style.css
├── routes
│   ├── index.js
│   └── users.js
└── views
    ├── error.jade
    ├── index.jade
    └── layout.jade

7 directories, 9 files
```

### 中间件
#### 应用级中间件
```
<!-- 没有挂载路径 -->
app.use(function (req, res, next) {
    ...

    next()
}, function (req, res, next) {
  console.log('Request Type:', req.method);
  next();
})
<!-- 挂载路径的中间件 -->
app.use('/user/', function(req, res, next){
    ...

    next()
})
路由和句柄函数，处理get（post）请求
app.get('/', function() {
    res.send('USER')
})
```
#### 路由级中间件
> var app = express()
> var router = express.Router()
```
和上面类似，只是写法不同
router.use('/', function(req, res, next) {
    ...

    next()
})

<!-- 此处理是在同一个文件夹下 -->
app.use('/', router)
```

#### 错误处理中间件
```
app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});
```

#### 内置中间件
> 唯一内置中间件：express.static()
* dotfiles	
是否对外输出文件名以点（.）开头的文件。        
可选值为 “allow”、“deny” 和 “ignore”	 
默认：ignore
* etag	
是否启用 etag 生成	
默认：true
* extensions	
设置文件扩展名备份选项	
默认：[]
* index	
发送目录索引文件，设置为 false 禁用目录索引。	
Mixed	
默认：“index.html”
* lastModified	
设置 Last-Modified 头为文件在操作系统上的最后修改日期。可能值为 true 或 false。		
默认：true
* maxAge	
以毫秒或者其字符串格式设置 Cache-Control 头的 max-age 属性。	
默认：0
* redirect	
当路径为目录时，重定向至 “/”。		
默认：true
* setHeaders	
设置 HTTP 头以提供文件的函数。	
Function	 
```
app.use(express.static('public', options));
```

#### 第三方中间件
##### cookie-parser
用于解析 cookie 的中间件
##### body-parser
用于解析request body部分，并对上传内容大小作出限制
```
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }));
```
#### canvas 
```
    var base64Data = req.body.imgData;
    var img = new Canvas.Image;

    img.onload = function(){
      var w = img.width;
      var h = img.height;
      var canvas = new Canvas(w, h);
      var ctx = canvas.getContext('2d');
      ctx.drawImage(img, 0, 0);

      var out = fs.createWriteStream(__dirname + '/crop.jpg');
      var stream = canvas.createJPEGStream({
        bufsize : 2048,
        quality : 80
      });

      stream.on('data', function(chunk){
        out.write(chunk);
      });

      stream.on('end', function(){
        out.end();
        res.send("上传成功！");
      });
    }

    img.onerror = function(err){
      res.send(err);
    }

    img.src = base64Data;
```
#### fs模块 (node自带模块)
对文件执行读取和写入
```
function(req, res, next) {
  if (req.body.formFile) {
    // 对象转换为字符串
    <!-- 先取出base64码 -->
    var base64Data = req.body.formFile.replace(/^data:image\/\w+;base64,/, "");
    <!-- 将base64码进行转码 -->
    var dataBuffer = new Buffer(base64Data, 'base64');
    <!-- 将文件导出为图片格式 -->
    fs.writeFile("out.png", dataBuffer, function (err) {
      if (err) {
        res.send(err);
      } else {
        res.send("保存成功！");
      }
    });
  }
}
```