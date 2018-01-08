var express = require('express');
var Datauri = require('datauri');
var path = require('path');
var multer = require('multer');
var cloudinary = require('cloudinary');

var router = express.Router();

var upload = multer({storage: multer.memoryStorage()})
var dUri = new Datauri();

/* GET photos listing. */
router.get('/', function(req, res, next) {
  res.render('photos/index');
});

router.post('/', upload.single('image_file'), function(req, res, next) {
  dUri.format(path.extname(req.file.originalname).toString(), req.file.buffer);

  cloudinary.uploader.upload(dUri.content)
  .then(function(image){
    res.render('index')
  })
  .catch(function(err){
    if (err){ console.warn(err);}
    return res.status(500);
  });
});

module.exports = router;
