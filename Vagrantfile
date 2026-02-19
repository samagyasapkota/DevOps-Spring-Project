# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/jammy64"
  
  # Jenkins Server
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.hostname = "jenkins-server"
    jenkins.vm.network "private_network", ip: "192.168.56.10"
<<<<<<< HEAD
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
=======
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
>>>>>>> 53d315c (Update project files)
    jenkins.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "jenkins-server"
    end
    jenkins.vm.provision "shell", inline: <<-SHELL
<<<<<<< HEAD
      set -e
      
      echo "=== Updating System ==="
      apt-get update
      
      echo "=== Installing Java 17 ==="
      apt-get install -y fontconfig openjdk-17-jre
      
      echo "=== Installing Docker ==="
      apt-get install -y docker.io git curl wget
      systemctl start docker
      systemctl enable docker
      usermod -aG docker vagrant
      usermod -aG docker jenkins || true
      
      echo "=== Installing Jenkins (Official Method) ==="
      curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
      
=======
      apt-get update
      apt-get install -y docker.io git openjdk-17-jre wget curl
      systemctl start docker
      systemctl enable docker
      usermod -aG docker vagrant
      
      curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
>>>>>>> 53d315c (Update project files)
      echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
      
      apt-get update
      apt-get install -y jenkins
      
<<<<<<< HEAD
      echo "=== Starting Jenkins ==="
      systemctl start jenkins
      systemctl enable jenkins
      
      echo "=== Waiting for Jenkins to start ==="
      sleep 30
      
      echo "=== Jenkins Initial Password ==="
      if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
        echo "============================================"
        echo "JENKINS INITIAL PASSWORD:"
        cat /var/lib/jenkins/secrets/initialAdminPassword
        echo "============================================"
        echo "Access Jenkins at: http://192.168.56.10:8080"
        echo "============================================"
      fi
      
      echo "=== Installing Docker Compose ==="
      curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      chmod +x /usr/local/bin/docker-compose
      ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose
      
      echo "=== Installation Complete ==="
    SHELL
  end

  # Monitoring Server (Prometheus + Grafana)
  config.vm.define "monitoring" do |monitor|
    monitor.vm.hostname = "monitoring"
    monitor.vm.network "private_network", ip: "192.168.56.30"
    monitor.vm.network "forwarded_port", guest: 9090, host: 9090  # Prometheus
    monitor.vm.network "forwarded_port", guest: 3000, host: 3000  # Grafana
    monitor.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "monitoring-server"
    end
    monitor.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y docker.io curl wget
      systemctl start docker
      systemctl enable docker
      usermod -aG docker vagrant
      
      # Install Docker Compose
      curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      chmod +x /usr/local/bin/docker-compose
      
      echo "Monitoring server ready!"
    SHELL
  end

  # Kubernetes Master
  config.vm.define "k8s-master" do |master|
=======
      systemctl start jenkins
      systemctl enable jenkins
      usermod -aG docker jenkins
      
      echo "Waiting for Jenkins to start..."
      sleep 30
    SHELL
  end

  # Monitoring Server
  config.vm.define "monitoring", autostart: false do |monitor|
    monitor.vm.hostname = "monitoring"
    monitor.vm.network "private_network", ip: "192.168.56.30"
    monitor.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
  end

  # Kubernetes Master
  config.vm.define "k8s-master", autostart: false do |master|
>>>>>>> 53d315c (Update project files)
    master.vm.hostname = "k8s-master"
    master.vm.network "private_network", ip: "192.168.56.20"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
<<<<<<< HEAD
      vb.name = "k8s-master"
=======
>>>>>>> 53d315c (Update project files)
    end
  end

  # Kubernetes Worker 1
<<<<<<< HEAD
  config.vm.define "k8s-worker1" do |worker|
=======
  config.vm.define "k8s-worker1", autostart: false do |worker|
>>>>>>> 53d315c (Update project files)
    worker.vm.hostname = "k8s-worker1"
    worker.vm.network "private_network", ip: "192.168.56.21"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
<<<<<<< HEAD
      vb.name = "k8s-worker1"
=======
>>>>>>> 53d315c (Update project files)
    end
  end

  # Kubernetes Worker 2
<<<<<<< HEAD
  config.vm.define "k8s-worker2" do |worker|
=======
  config.vm.define "k8s-worker2", autostart: false do |worker|
>>>>>>> 53d315c (Update project files)
    worker.vm.hostname = "k8s-worker2"
    worker.vm.network "private_network", ip: "192.168.56.22"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
<<<<<<< HEAD
      vb.name = "k8s-worker2"
=======
>>>>>>> 53d315c (Update project files)
    end
  end

end
