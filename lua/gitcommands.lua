local api = vim.api
local model = {}
function model.reset_current_branch()
    local output = api.nvim_command_output('!git symbolic-ref --short HEAD')
    local tokens = vim.split(output, '\n')
    local branch = tokens[3]
    print('Resetting ' .. branch .. ' to origin/' .. branch)
    api.nvim_command('!git reset --hard @{u}')
end

function model.checkout_branch(branch)
    print("Begin checkout branch " .. branch)
    local branch_name = branch
    local prefix = "origin/"
    if (string.find(branch, prefix) == 1)
    then
        local branch_name = string.sub(branch, string.len(prefix) + 1)
        print('Checkout with remote tracking: ' .. branch_name)
        local command = '!git switch --discard-changes -C ' .. branch_name .. ' --track ' .. branch;
        api.nvim_command(command)
    else
        print('Checkout local branch: ' .. branch)
        api.nvim_command('!git switch -f ' .. branch)
    end
end
return model
