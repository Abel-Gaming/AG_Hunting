Config = {}

Config.Framework = 'Other' -- Options are 'ESX' or 'Other' which requires you to modify the Add Money function below

Config.Animals = {
    ['a_c_coyote'] = {
        Worth = 15
    },
    ['a_c_deer'] = {
        Worth = 25
    },
    ['a_c_mtlion'] = {
        Worth = 30
    },
    ['a_c_pig'] = {
        Worth = 10
    },
    ['a_c_rabbit_01'] = {
        Worth = 5
    }
}

function AddMoneyCode(amount)
    -- Add your client side code to add money here
    print('Added $' .. amount)
end