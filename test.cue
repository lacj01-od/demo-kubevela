p: {
	abc: string
	xyz: int
}

x: {
	jojo: "p.abc - ${p.xyz}"
}
z: {
	pp: x.jojo
}
p: {
	abc: "123ABC"
	xyz: 321
}