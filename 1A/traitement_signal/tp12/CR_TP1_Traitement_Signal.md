# Compte rendu TP1 Traitement du signal.
Nicolas FOIN 1SN


## 5.2 Effet de l'échantillonage
**Q4**

Sur la figure 1 on observe bien une frequence d'environ 1100Hz.
Cependant la frequence mesurée sur la figure 2 est de 100 Hz, ce qui ne corresponds pas à la fréquence du signal. Ceci est la conséquence du non respect du critère de Shannon. En effet le signal est sous-echantilloné.

## 5.3 TFD
**Q1 Etude théorique**

- X(f)=A(d(f-f0) + d(f+f0)) \
avec d(x)=1 si x=0 et 0 sinon \
Le tracé de |X| correspond à deux dirac d'amplitude A en -f0 et f0.
- x est une somme de dirac multiplié par une fenetre de longeur (N-1)Te, donc X est un un sinus cardinal.
xe(t)=(sum i=0 to N-1 of x(iTe)*d(t-kTe))*P

---

# Markdown2PDF
> Awesome Markdown to PDF!
```diff
- Online? Upload resume.md to stranger server?
+ Try Offline Web App!
```

## How to use md2pdf?
1. Click button choose `.md` file.
2. Edit in editor (left panel).
3. Click **Transform**!
4. Switch 'Destination' to **Save as PDF**.
5. **Chrome recommended**
- `Resize` the layout what you want.
<blockquote>Hey I'm in blockquote!</blockquote>






