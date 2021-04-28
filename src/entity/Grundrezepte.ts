import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { Pizza } from "./Pizza";
@Entity()
export class Grundrezepte {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  beschreibung: string;

  @OneToMany((type) => Pizza, (pizza) => pizza.id)
  pizza: Pizza[];
}
