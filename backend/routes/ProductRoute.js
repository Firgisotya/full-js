var express = require('express');

const {
    getAllProducts, getProductById, storeProduct, updateProduct, destroyProduct,
} = require('../controller/ProductController');

var router = express.Router();

router.get('/', getAllProducts);
router.get('/:id', getProductById);
router.post('/', storeProduct);
router.put('/:id', updateProduct);
router.delete('/:id', destroyProduct);

module.exports = router;