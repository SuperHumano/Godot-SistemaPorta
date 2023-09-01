![ezgif com-video-to-gif](https://github.com/SuperHumano/Godot-SistemaPorta/assets/127708514/2702cd23-66da-4e2d-b207-6bcf90dfb621)

 # Godot4.1 Sistema Porta

Este projeto exemplifica uma interação simples e eficaz entre Jogador e porta.
Ao todo são três cenas: Mundo, Porta e Jogador.
- O mundo é apenas um local para tornar possível a interação, em Scripts, seu respectivo script trata da ação sair.
- A porta é respectiva da importação de um modelo Sketchfab, em Scripts, temos o script de movimento da porta com ativação do jogador, para melhor visualização do modelo e crédito ao artista acesse:
https://sketchfab.com/3d-models/door-with-frame-2f2f149f3ec44d658a02c1f924dfa449
- O jogador é uma capsula com raycast, em Scripts, possui movimentação básica e função _interact() para interagir com possíveis objetos

## Importante

Note que nos scrips os inputs estão personalizados: "esquerda", "direita", "frente", "tras", "pular", "interagir", "sair".
Portanto caso for importar estas pastas para seu projeto, defina seu InputMap em Project Settings e modifique os inputs no script à sua preferência.
