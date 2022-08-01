CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	"senha" TEXT NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Produtos" (
	"nome" TEXT NOT NULL,
	"preco" bigint NOT NULL,
	"idcategoria" integer NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "Produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Fotos" (
	"id" serial NOT NULL,
	"idProduto" bigint NOT NULL,
	"urlImagem" bigint NOT NULL,
	"fotoPrincial" BOOLEAN NOT NULL DEFAULT 'false',
	CONSTRAINT "Fotos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categoria" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "Categoria_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tamanhos" (
	"id" serial NOT NULL,
	"idProduto" integer NOT NULL,
	"tamanho" varchar(255) NOT NULL,
	CONSTRAINT "Tamanhos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Compras" (
	"id" serial NOT NULL,
	"idUser" serial NOT NULL,
	"idProduto" serial NOT NULL,
	"idstatus" serial NOT NULL,
	"date" serial NOT NULL DEFAULT 'null',
	"endereço" TEXT NOT NULL,
	CONSTRAINT "Compras_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.status" (
	"id" serial NOT NULL,
	"tipo" serial(255) NOT NULL,
	CONSTRAINT "status_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Endereços" (
	"id" serial NOT NULL,
	"idUSer" serial NOT NULL,
	"Rua" varchar(255) NOT NULL,
	"Numero" varchar(255) NOT NULL,
	"Estado" varchar(255) NOT NULL,
	CONSTRAINT "Endereços_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "Fotos" ADD CONSTRAINT "Fotos_fk0" FOREIGN KEY ("idProduto") REFERENCES "Produtos"("id");

ALTER TABLE "Categoria" ADD CONSTRAINT "Categoria_fk0" FOREIGN KEY ("id") REFERENCES "Produtos"("idcategoria");

ALTER TABLE "Tamanhos" ADD CONSTRAINT "Tamanhos_fk0" FOREIGN KEY ("idProduto") REFERENCES "Produtos"("id");

ALTER TABLE "Compras" ADD CONSTRAINT "Compras_fk0" FOREIGN KEY ("idUser") REFERENCES "Users"("id");
ALTER TABLE "Compras" ADD CONSTRAINT "Compras_fk1" FOREIGN KEY ("idProduto") REFERENCES "Produtos"("id");
ALTER TABLE "Compras" ADD CONSTRAINT "Compras_fk2" FOREIGN KEY ("idstatus") REFERENCES "status"("id");


ALTER TABLE "Endereços" ADD CONSTRAINT "Endereços_fk0" FOREIGN KEY ("idUSer") REFERENCES "Users"("id");









