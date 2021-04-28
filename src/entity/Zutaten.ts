import { Lagerbedingung } from "./Lagerbedingung";
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToMany,
  ManyToOne,
  JoinTable,
} from "typeorm";
import { Standort } from "./Standort";
import { Lieferant } from "./Lieferant";
import { Pizza } from "./Pizza";
@Entity()
export class Zutaten {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  beschreibung: string;

  @ManyToMany((type) => Pizza, (pizza) => pizza.zutaten)
  @JoinTable()
  pizza: Pizza[];

  @ManyToMany((type) => Lieferant, (lieferant) => lieferant.zutaten)
  @JoinTable()
  lieferant: Lieferant[];

  @ManyToOne((type) => Standort, (standort) => standort.id)
  standort: Standort[];

  @ManyToOne(
    (type) => Lagerbedingung,
    (lagerbedingung) => lagerbedingung.zutaten
  )
  lagerbedingung: Lagerbedingung;
}
