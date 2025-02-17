searching=false

if not searching then
			searching=true
			debug('Scanning...', 3)
			if not findRemote() then
				searching=false
			end
end

for i=1,100 do
			for i,remote in remotes do
				local code=i
				
				if workspace:FindFirstChild(code) then
					
					notify('Backdoor found! '..os.clock()-timee..'s')
          
					
					backdoor=remote
					debug(remote:GetFullName(), 3)
        end
     end
end

