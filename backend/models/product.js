'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  const Brand = sequelize.define('Brand')
  const Category = sequelize.define('Category')
  const Product = sequelize.define('Product', {
    name: DataTypes.STRING,
    brandId: DataTypes.INTEGER,
    categoryId: DataTypes.INTEGER,
    price: DataTypes.INTEGER,
    image: DataTypes.STRING,
    url: DataTypes.STRING,
  }, {});
  Product.belongsTo(Brand, {foreignKey: 'brandId'});
  Product.belongsTo(Category, {foreignKey: 'categoryId'});
  return Product;
};