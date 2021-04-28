import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import { Zutaten } from "./Zutaten";
@Entity()
export class Standort {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  beschreibung: string;

  @OneToMany((type) => Zutaten, (zutaten) => zutaten.id)
  zutaten: Zutaten[];
}
