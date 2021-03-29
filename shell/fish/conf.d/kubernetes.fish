set -x NS $USER
alias me='set -x NS $USER'
alias kube-system='set -x NS kube-system'

alias k='kubectl -n $NS'
alias kaf='k apply -f'
# alias kca='_kca(){ kubectl "$@" --all-namespaces;  unset -f _kca; }; _kca'
alias kccc='kubectl config current-context'
alias kcdc='kubectl config delete-context'
alias kcgc='kubectl config get-contexts'
alias kcn='kubectl config set-context (kubectl config current-context) --namespace'
alias kcp='k cp'
alias kcsc='kubectl config set-context'
alias kcuc='kubectl config use-context'
alias kdcj='k describe cronjob'
alias kdcm='k describe configmap'
alias kdd='k describe deployment'
alias kdds='k describe daemonset'
alias kdel='k delete'
alias kdelcj='k delete cronjob'
alias kdelcm='k delete configmap'
alias kdeld='k delete deployment'
alias kdelds='k delete daemonset'
alias kdelf='k delete -f'
alias kdeli='k delete ingress'
alias kdelno='k delete node'
alias kdelns='k delete namespace'
alias kdelp='k delete pods'
alias kdelpvc='k delete pvc'
alias kdels='k delete svc'
alias kdelsa='k delete sa'
alias kdelsec='k delete secret'
alias kdelss='k delete statefulset'
alias kdi='k describe ingress'
alias kdno='k describe node'
alias kdns='k describe namespace'
alias kdp='k describe pods'
alias kdpvc='k describe pvc'
alias kds='k describe svc'
alias kdsa='k describe sa'
alias kdsec='k describe secret'
alias kdss='k describe statefulset'
alias kecj='k edit cronjob'
alias kecm='k edit configmap'
alias ked='k edit deployment'
alias keds='k edit daemonset'
alias kei='k edit ingress'
alias keno='k edit node'
alias kens='k edit namespace'
alias kep='k edit pods'
alias kepvc='k edit pvc'
alias kes='k edit svc'
alias kess='k edit statefulset'
alias keti='k exec -ti'
alias kga='k get all'
alias kgaa='kubectl get all --all-namespaces'
alias kgcj='k get cronjob'
alias kgcm='k get configmaps'
alias kgcma='kubectl get configmaps --all-namespaces'
alias kgd='k get deployment'
alias kgda='kubectl get deployment --all-namespaces'
alias kgds='k get daemonset'
alias kgi='k get ingress'
alias kgia='kubectl get ingress --all-namespaces'
alias kgno='kubectl get nodes'
alias kgns='kubectl get namespaces'
alias kgp='k get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpvc='k get pvc'
alias kgpvca='kubectl get pvc --all-namespaces'
alias kgrs='k get rs'
alias kgs='k get svc'
alias kgsa='k get sa'
alias kgsec='k get secret'
alias kgseca='kubectl get secret --all-namespaces'
alias kgss='k get statefulset'
alias kgssa='kubectl get statefulset --all-namespaces'
alias kl='k logs'
alias kl1h='k logs --since 1h'
alias kl1m='k logs --since 1m'
alias kl1s='k logs --since 1s'
alias klf='k logs -f'
alias klf1h='k logs --since 1h -f'
alias klf1m='k logs --since 1m -f'
alias klf1s='k logs --since 1s -f'
alias kpf='k port-forward'
alias krh='k rollout history'
alias krsd='k rollout status deployment'
alias krsss='k rollout status statefulset'
alias kru='k rollout undo'
alias ksd='k scale deployment'
alias ksss='k scale statefulset'

function wpods;
   set grep $argv
   set len (echo $grep | wc -c)
   if test $len -gt 0
      set grep (echo $grep | sed 's/ /|/g')
      set grep "| egrep '$grep'"
   end
   watch -n 1 -c -t "kubectl -n $NS get pods $grep | khl"
end

# exec into a pod without having to specify the entire pod name
function ksh;
   set what $argv[1]
   set shell bash
   if test (count $argv) -gt 1
      set shell $argv[2]
   end

   set firstPod (kgrep $what --phase Running | head -1)
   echo "Found running pod $firstPod in namespace $NS"
   keti $firstPod -- $shell
end

