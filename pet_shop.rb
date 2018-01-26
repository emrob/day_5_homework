def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  breed_array = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_array << breed
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(pet_shop, customer, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      customer[:pets] << pet
      pet_shop[:pets].delete(pet)
    end
  end
end

def customer_can_afford_pet(pet_shop, customer, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      price = pet[:price]
    end
  end
  if customer[:cash] >= price
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, customer, pet)
  if pet == nil
    p "Sorry #{customer[:name]}, we don't have a pet by that name."
  else
    if customer_can_afford_pet(pet_shop, customer, pet[:name]) == true
      add_pet_to_customer(pet_shop, customer, pet[:name])
      increase_pets_sold(pet_shop, 1)
      add_or_remove_cash(pet_shop, pet[:price])
    else
      p "Sorry #{customer[:name]}, you don't have enough cash to buy #{pet[:name]}, you only have £#{customer[:cash]} to your name!"
    end
  end
end
