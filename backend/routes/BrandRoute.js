var express = require('express');

const {
    getBrandById, getAllBrand, storeBrand, updateBrand, destroyBrand,
} = require('../controller/BrandController');

var router = express.Router();

router.get('/', getAllBrand);
router.get('/:id', getBrandById);
router.post('/', storeBrand);
router.put('/:id', updateBrand);
router.delete('/:id', destroyBrand);

module.exports = router;