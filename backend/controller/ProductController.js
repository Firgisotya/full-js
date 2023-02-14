const { Product, Brand, Category, sequelize } = require("../models");
const path = require('path');
const fs = require('fs');

module.exports = {
  getAllProducts: async (req, res) => {
    try {
      const products = await Product.findAll({
        include: [
          { attributes: ["name"], model: Brand },
          { attributes: ["name"], model: Category },
        ],
      });
      res.status(200).json({
        message: "Success",
        products,
      });
    } catch (error) {
      throw error;
    }
  },
  getProductById: async (req, res) => {
    try {
      const id = req.params.id;
      const product = await Product.findOne({
        where: { id },
        include: [
          { attributes: ["name"], model: Brand },
          { attributes: ["name"], model: Category },
        ],
      });
      res.status(200).json({
        message: "Success",
        product,
      });
    } catch (error) {
      throw error;
    }
  },
  storeProduct: async (req, res) => {
    if(req.file == null) return res.status(400).json({message: "Image is required"})
    const name = req.body.name;
    const brandId = req.body.brandId;
    const categoryId = req.body.categoryId;
    const price = req.body.price;
    const image = req.file.path;
    const url = req.protocol + "://" + req.get("host") + "/images/" + req.file.filename;
    try {
      const product = await Product.create({
        name: name,
        brandId: brandId,
        categoryId: categoryId,
        price: price,
        image: image,
        url: url,
      });
      res.status(201).json({
        message: "Success Create Data",
        product,
      });
    } catch (error) {
      throw error;
    }

  
  },
  updateProduct: async (req, res) => {
    //update product
    const id = req.params.id;
    const product = await Product.findOne({
      where: { id },
    });
    if(!product) return res.status(404).json({message: "Product not found"})
    const name = req.body.name;
    const brandId = req.body.brandId;
    const categoryId = req.body.categoryId;
    const price = req.body.price;
    const image = req.file.path;
    const url = req.protocol + "://" + req.get("host") + "/images/" + req.file.filename;

    

    try {
      if(req.file){
        if(fs.existsSync(req.file.path)){
          fs.unlink(req.file.path, (err) => {
            if(err) throw err;
          })
        }
      } else {
        image = product.image
        url = product.url
      }
      await Product.update(
        {
          name: name,
          brandId: brandId,
          categoryId: categoryId,
          price: price,
          image: image,
          url: url,
        },
        { where: { id: id } }
      );
      res.status(201).json({
        message: "Success Update Data",
      });
    } catch (error) {
      throw error;
    }
  },
  destroyProduct: async (req, res) => {
      const product = await Product.findOne({
        where: { id: req.params.id }
      });
      if(!product) return res.status(404).json({message: "Product not found"})
    try {
      const filePath = `./public/images/product/${product.image}`;
      fs.unlinkSync(filePath);
      await Product.destroy({
        where: { id: req.params.id },
      });
      res.status(201).json({
        message: "Success Delete Data",
        product,
      });
    } catch (error) {
      throw error;
    }
  },

  countBrand: async (req, res) => {
    try {
      const count = await Product.findAll({
        group: ["brandId"],
        attributes: [ // alias
          [sequelize.fn("COUNT", "brandId"), "count"],
        ],
        include: [{ attributes: ["name"], model: Brand }],
      });
      res.status(200).json({
        message: "Success",
        count,
      });
    } catch (error) {
      throw error;
    }
  },

    countCategory: async (req, res) => {
        try {
            const count = await Product.findAll({
                group: ['categoryId'],
                attributes: [
                    [sequelize.fn('COUNT', 'categoryId'), 'count']
                ],
                include: [{ attributes: ['name'], model: Category }]
            })
            res.status(200).json({
                message: 'Success',
                count
            })
        } catch (error) {
            throw error
        }
    },

};