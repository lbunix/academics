function userAdminMenu {
    param (
        $title = 'User/Group Admin Menu'
    )

    Write-Host "========== $title =========="
    Write-Host "`n1. Create a new local user"
    Write-Host "2. Add local user to a security group"
    Write-Host "3. Remove a local user"
    Write-Host "4. Remove a local user from a security group"
    Write-Host "5. Add a new local group"
    Write-Host "6. Remove a local group"
    Write-Host "7. List users/ groups"
    Write-Host "8. Quit menu"

}

function listUsers {
    param (
        $title = 'Users'
    )

    Write-Host "========== $title =========="
    Get-LocalUser

}

function listGroups {
    param (
        $title = 'Groups'
    )

    Write-Host "========== $title =========="
    Get-LocalGroup

  }

:userList while ($true) {

        $select = Read-Host "`nWould you like to list the current users? (y/NO) "
        switch ($select) {
        
            { $_ -in @("y", "yes") } {
                listUsers

                while ($true) {

                    $userInfo = Read-Host "`nWould you like to retrieve more information of a user? (y/YES or n/NO)"

                    if ($userInfo -in @("y", "yes")) {
                        $userSelect = Read-Host "`nEnter the username"

                        Get-LocalUser -Name $userSelect | 
                            select-Object *

                        break

                    }
                    elseif ($userInfo -in @("n", "no")) {
                        break
                    }
                    else {
                        Write-Host "`nInvalid Input. Enter y/YES or n/NO."
                    }
                }
            }

            { $_ -in @("n", "no") } {
                break userList
            }
            
            default {
                Write-Host "`nInvalid input. Please input y/YES or n/NO."
            }
      }

}

:groupList while ($true) {

        $select = Read-Host "`nWould you like to list the current groups? (y/NO) "
        switch ($select) {
        
            { $_ -in @("y", "yes") } {
                listGroups
            }

            { $_ -in @("n", "no") } {
                break groupList
            }
            
            default {
                Write-Host "`nInvalid input. Please input y/YES or n/NO."
            }
      }

}

$quit = "no"

while ($quit -ne "yes") {

    userAdminMenu

    $select = Read-Host "`nSelect an option (number) from the menu"
    switch ($select) {

        1 {
            Clear-Host

            :userCreation while ($true) {
        
                $screenName = Read-Host "Input a username"
                $password = Read-Host "Input a password" -AsSecureString
                $firstName = Read-Host "Input the user's first name"
                $lastName = Read-Host "Input the user's last name"
                $description = Read-Host "Input a description"

                Write-Host "`nYou entered:"
                Write-Host "Username:    $screenName"
                Write-Host "Full name:   $firstName $lastName"
                Write-Host "Description: $description"

                $userCreationConfirm = Read-Host "Is the information correct? (y/YES or n/NO)"
                switch ($userCreationConfirm) {

                    { $_ -in @("y", "yes") } {
                        Write-Host "Creating user $screenName.."

                        New-LocalUser -Name $screenName -Password $password -Fullname "$firstName $lastName" -Description $description

                        break userCreation
                    }

                    { $_ -in @("n", "no") } {
                        Write-Host "`nReturning to user creation"
                        continue userCreation
                    }

                    default {
                        Write-Host "Invalid Input. Enter y/YES or n/NO"
                        continue userCreation

                    }
                }
            }
        }


        2 {
        
           Clear-Host

           :userAddGroup while ($true) {

               Get-LocalUser
               $userSelect = Read-Host "`nSelect a user"

               Get-LocalGroup
               $groupSelect = Read-Host "`nSelect a group you would like to add the user to"

               Write-Host "`nYou entered:"
               Write-Host "User:  $userSelect"
               Write-Host "Group: $groupSelect"

               $userGroupConfirm = Read-Host "Is the information correct? (y/YES or n/NO)"
               switch ($userGroupConfirm) {

                    { $_ -in @("y", "yes")} {
                        Write-Host "Adding $userSelect to $groupSelect.."
                    
                        Add-LocalGroupMember -Group $groupSelect -Member $userSelect

                        Get-LocalUser -Name $userSelect |
                            Select-Object *

                        break userAddGroup
                    }

                    { $_ -in @("n", "no") } {
                        Write-Host "`nReturning to selection"
                        continue userAddGroup
                    }

                    Default {
                        Write-Host "Invalid Input. Enter y/YES or n/NO."
                        continue userAddGroup
                    }
                }
            }

        }


        3 {

           Clear-Host

           :removeUser while ($true) {

                Get-LocalUser
                $userSelect = Read-Host "`nSelect a user to remove"

                Write-Host "`nYou entered:"
                Write-Host "User: $userSelect"

                $userConfirm = Read-Host "`nIs the user correct? (y/YES or n/NO)"

                switch ($userConfirm) {

                    { $_ -in @("y", "yes") } {
                        Write-Host "Removing $userSelect.."

                        Remove-LocalUser -Name $userSelect

                        break removeUser

                    }

                    { $_ -in @("n", "no") } {
                        Write-Host "`nReturning to user selection"
                        continue removeUser
                    }

                    Default {
                        Write-Host "Invalid Input. Enter y/YES or n/NO."
                        continue removeUser
                    }
                }
            }
        }

        4 {

           Clear-Host

           :removeUserGroup while ($true) {
                
                Get-LocalUser
                $userSelect = Read-Host "`nSelect a user"

                Get-LocalGroup
                $groupSelect = Read-Host "`nSelect a group you would like to remove the user from"

                Write-Host "`nYou entered:"
                Write-Host "User:  $userSelect"
                Write-Host "Group: $groupSelect"

                $userGroupConfirm = Read-Host "Is the information correct? (y/YES or n/NO)"
                switch ($userGroupConfirm) {
                    { $_ -in @("y", "yes") } {
                        Write-Host "Removing $userSelect from $groupSelect.."

                        Remove-LocalGroupMember -Group $groupSelect -Member $userSelect

                        Get-LocalUser -Name $userSelect |
                            Select-Object *

                        break removeUserGroup

                    }

                    { $_ -in @("n", "no") } {
                        Write-Host "`nReturning to selection"
                        continue removeUserGroup
                    }

                    Default {
                        Write-Host "Invalid Input. Enter y/YES or n/NO."
                        continue removeUserGroup
                    }
                }
            }
        }

        5 {

           Clear-Host

           :createGroup while ($true) {

                $groupName = Read-Host "Input new group name"

                Write-Host "`nYou entered:"
                Write-Host "Group: $groupName"

                $groupNameConfirm = Read-Host "Is this information correct? (y/YES or n/NO)"
                switch ($groupNameConfirm) {
                    { $_ -in @("y", "yes") } {
                        Write-Host "Creating group: $groupName"

                        New-LocalGroup -Name $groupName

                        Get-LocalGroup

                        break createGroup
                    }

                    { $_ -in @("n", "no") } {
                        Write-Host "`nReturning to selection"
                        continue createGroup
                    }

                    default {
                        Write-Host "Invalid Input. Enter y/YES or n/NO."
                        continue createGroup
                    }
                }
           }
        }

        6 {
           
           Clear-Host

           :removeGroup while ($true) {

                Get-LocalGroup
                $groupSelect = Read-Host "Input the group name"

                Write-Host "`nYou entered:"
                Write-Host "Group: $groupSelect"

                $groupSelectConfirm = Read-Host "Is the information correct? (y/YES or n/NO)"
                switch ($groupSelectConfirm) {
                    
                    { $_ -in @("y", "yes") } {
                        Write-Host "Removing $groupSelect"

                        Remove-LocalGroup -Name $groupSelect

                        Get-LocalGroup

                        break removeGroup
                    }

                    { $_ -in @("n", "no") } {
                        Write-Host "`nReturning to group seleciton"
                        continue removeGroup
                    }

                    Default {
                        Write-Host "`nInvalid Input. Enter y/YES or n/NO."
                        continue removeGroup
                    }
                }
            }
        }

        7 {
           
           Clear-host

           listUsers

           groupUsers

        }

        default {
            Write-Host "Invalid selection. Enter options 1 - 8."
        }
    }
}
