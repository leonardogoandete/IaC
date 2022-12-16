#!/bin/bash
cd ~
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo python3 -m pip install ansible
tee -a playbook.yml > /dev/null <<EOT
- hosts: localhost
  tasks:
    - name: Instalando o python3 e VirtualEnv
      apt:
        pkg: 
        - python3
        - virtualenv
        update-cache: yes # atualiza os repositorios
      become: yes # instala os pacotes como root
    - name: Git Clone
      ansible.builtin.git:
        repo: https://github.com/alura-cursos/clientes-leo-api.git
        dest: ~/tcc
        version: master
        force: yes
    - name: Instalando dependencias com pip (Django e Django Rest)
      pip:
        virtualenv: ~/tcc/venv
        requirements: ~/tcc/requirements.txt
    - name: Alterando o hosts do settings
      lineinfile:
        path: ~/tcc/setup/settings.py
        regexp: 'ALLOWED_HOSTS'
        line: 'ALLOWED_HOSTS = ["*"]'
        backrefs: yes # se nao achar a regex, ele não altera
    - name: Confiruando o banco de dados
      shell: '. ~/tcc/venv/bin/activate; python ~/tcc/manage.py migrate'
    - name: Carrgendo dados iniciais
      shell: '. ~/tcc/venv/bin/activate; python ~/tcc/manage.py loaddata clientes.json'
    - name: Ativando servico
      shell: '. ~/tcc/venv/bin/activate; nohup python ~/tcc/manage.py runserver 0.0.0.0:8000 &'
python get-pip.py
EOT
ansible-playbook playbook.yml