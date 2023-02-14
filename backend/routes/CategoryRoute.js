var express = require('express');

const {
    getAllCategory, getCategoryById, storeCategory, updateCategory, destroyCategory
} = require('../controller/CategoryController');

var router = express.Router();

router.get('/', getAllCategory);
router.get('/:id', getCategoryById);
router.post('/', storeCategory);
router.put('/:id', updateCategory);
router.delete('/:id', destroyCategory);

module.exports = router;