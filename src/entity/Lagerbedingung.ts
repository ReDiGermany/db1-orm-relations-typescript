import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { Zutaten } from "./Zutaten";
@Entity()
export class Lagerbedingung {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  beschreibung: string;

  @OneToMany((type) => Zutaten, (zutaten) => zutaten.lagerbedingung)
  zutaten: Zutaten;
}
