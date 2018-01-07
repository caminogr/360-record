var express = require('express');
var router = express.Router();

var multer = require('multer');
var upload = multer({ dest: './public/images/uploads/' });

var cloudinaryUploader = require('../lib/cloudinaryUploader');

router.post('/', upload.single('image_file'), function(req, res, next) {
  let path = req.file.path;

  cloudinaryUploader.uploadImage(path);
});

module.exports = router;
