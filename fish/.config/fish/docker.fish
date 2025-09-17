# docker aliases
function rundeepdkr --description "Run Deepseek in docker"
    docker exec -it condescending_shockley ollama run deepseek-r1
end

function runopenwebui --description "start open-webui"
    docker exec -it condescending_shockley ollama run deepseek-r1
end
