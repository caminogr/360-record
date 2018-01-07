const cloudinary = require('cloudinary');

module.exports = {
  async uploadImage(filePath) {
    try {
      await cloudinary.v2.uploader.upload(filePath);
    } catch(error) {
      console.log(error)
    }
  }
};
