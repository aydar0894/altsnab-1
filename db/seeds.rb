# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.find_by(role: '1')
if users.nil?
    User.create(name: 'Administrator', email: 'admin@altsnab.ru', password: 'admin_altsnab', role: '1')
end

#
#
# Создание полей
#
#

if Field.count == 0
    fields = [
        { name: 'Цвет' },
        { name: 'Вес' },
        { name: 'Ширина' },
        { name: 'Высота' },
        { name: 'Длинна' }
    ]

    Field.create(fields)
end

#
#
# Создание категорий
#
#

if Category.count == 0
    categories = [
        { name: 'Категория-1', is_leaf: false },
        { name: 'Категория-2', is_leaf: false },
        { name: 'Категория-1-1', is_leaf: true, parent_category_id: 1 },
        { name: 'Категория-1-2', is_leaf: true, parent_category_id: 1 },
        { name: 'Категория-2-1', is_leaf: true, parent_category_id: 2 },
    ]

    Category.create(categories);
end

#
#
# Привязка полей к категориям
#
#

if CategoryField.count == 0

    category_fields = []

    Category.where(is_leaf: true).each do |category|
        Field.count.times do |index|
            category_fields << { category_id: category.id, field_id: index + 1 }
        end
    end

    # Category.where(is_leaf: true).each do |category|
    #     count = rand(Field.count)
    #
    #     count.times do |index|
    #         category_fields << { category_id: category.id, field_id: index + 1 }
    #     end
    # end

    CategoryField.create(category_fields);
end

#
#
# Создание товаров
#
#

if Item.count == 0

    items = []

    leaf_categories = Category.where(is_leaf: true)
    counter = 1

    leaf_categories.each do |leaf_category|
        5.times do |index|
            new_item = {
                name: "Товар #{counter}",
                description: "Описание товара №#{counter}",
                category_id: leaf_category.id,
                price: rand(10...40) * 100
            }
            items << new_item
            counter = counter + 1
        end
    end

    Item.create(items);
end

#
#
# Заполнение полей у товаров
#
#

if CategoryFieldValue.count == 0
    category_field_values = []
    items = Item.all

    items.each do |item|
        item_category_fields = item.category.category_fields
        item_category_fields.each do |item_category_field|
            new_category_field_value = {
                item_id: item.id,
                category_field_id: item_category_field.id,
                value: 'Значение'
            }
            category_field_values << new_category_field_value
        end
    end

    CategoryFieldValue.create(category_field_values)
end
